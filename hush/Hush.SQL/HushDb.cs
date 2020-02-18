using Microsoft.EntityFrameworkCore;

namespace Hush.SQL
{
  public class HushDb : DbContext
  {
    protected override void OnModelCreating(ModelBuilder m)
    {
      base.OnModelCreating(m);
      m.Entity<AccessToken>().HasKey(x => x.Id);
      m.Entity<AccessToken>().HasIndex(x => x.Token).IsUnique();
      m.Entity<AccessToken>().HasIndex(x => new {x.UserId, x.DeviceId});

      m.Entity<AccountData>().HasIndex(x => new {x.UserId, x.Kind}).IsUnique();
      m.Entity<AccountData>().HasIndex(x => new {x.UserId, x.StreamId});

      m.Entity<AccountValidity>().HasKey(x => x.UserId);

      m.Entity<AppService>().HasKey(x => x.Id);
      m.Entity<AppServiceTxn>().HasIndex(x => new {x.AppServiceId, x.TxnId}).IsUnique();
      m.Entity<AppServiceTxn>().HasIndex(x => x.AppServiceId);
      m.Entity<AppServiceRoomList>().HasIndex(x => new {x.AppServiceId, x.NetworkId, x.RoomId}).IsUnique();

      m.Entity<AppServiceStreamPosition>().Property(x => x.Lock).HasDefaultValue("X");
      m.Entity<AppServiceStreamPosition>().HasIndex(x => x.Lock).IsUnique();

      m.Entity<BackgroundUpdate>().HasIndex(x => x.Name).IsUnique();

      m.Entity<CacheInvalidationStream>().HasIndex(x => x.StreamId);

      m.Entity<CurrentStateDeltaStream>().HasIndex(x => x.StreamId);

      m.Entity<CurrentStateEvent>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<CurrentStateEvent>().HasIndex(x => new {x.RoomId, x.Kind, x.Key}).IsUnique();

      m.Entity<DeletedPusher>().HasIndex(x => x.StreamId);

      m.Entity<Destination>().HasKey(x => x.Id);

      m.Entity<Device>().HasIndex(x => new {x.UserId, x.DeviceId}).IsUnique();
      m.Entity<DeviceFederationInbox>().HasIndex(x => new {x.Origin, x.MessageId});
      m.Entity<DeviceFederationOutbox>().HasIndex(x => x.StreamId);
      m.Entity<DeviceFederationOutbox>().HasIndex(x => new {x.Destination, x.StreamId});
      m.Entity<DeviceInbox>().HasIndex(x => new {x.UserId, x.DeviceId, x.StreamId});
      m.Entity<DeviceListOutboundLastSuccess>().HasIndex(x => new {x.Destination, x.UserId, x.StreamId});
      m.Entity<DeviceListOutboundPoke>().HasIndex(x => new {x.StreamId});
      m.Entity<DeviceListOutboundPoke>().HasIndex(x => new {x.Destination, x.StreamId});
      m.Entity<DeviceListOutboundPoke>().HasIndex(x => new {x.Destination, x.UserId});
      m.Entity<DeviceListRemoteCache>().HasIndex(x => new {x.UserId, x.DeviceId}).IsUnique();
      m.Entity<DeviceListRemoteEnd>().HasIndex(x => x.UserId).IsUnique();
      m.Entity<DeviceListStream>().HasIndex(x => new {x.StreamId, x.UserId});
      m.Entity<DeviceListStream>().HasIndex(x => new {x.UserId, x.DeviceId});

      m.Entity<E2EDeviceKey>().HasIndex(x => new {x.UserId, x.DeviceId}).IsUnique();
      m.Entity<E2EOnceKey>().HasIndex(x => new {x.UserId, x.DeviceId, x.Algorithm, x.KeyId}).IsUnique();
      m.Entity<E2ERoomKeyVersion>().HasIndex(x => new {x.UserId, x.Version}).IsUnique();

      m.Entity<EventAuth>().HasIndex(x => x.EventId);

      m.Entity<EventBackwardEnd>().HasIndex(x => new {x.RoomId});
      m.Entity<EventBackwardEnd>().HasIndex(x => new {x.EventId, x.RoomId}).IsUnique();

      m.Entity<EventEdge>().HasIndex(x => x.EventId);
      m.Entity<EventEdge>().HasIndex(x => x.PrevEventId);
      m.Entity<EventEdge>().HasIndex(x => new {x.EventId, x.PrevEventId, x.RoomId, x.IsState}).IsUnique();

      m.Entity<EventForwardEnd>().HasIndex(x => x.RoomId);
      m.Entity<EventForwardEnd>().HasIndex(x => new {x.EventId, x.RoomId}).IsUnique();

      m.Entity<EventPushAction>().HasIndex(x => new {x.EventId, x.UserId, x.ProfileTag}).IsUnique();
      //where highlight = 1
      m.Entity<EventPushAction>().HasIndex(x => new {x.UserId, x.RoomId, x.TopologicalOrdering, x.StreamOrdering});
      m.Entity<EventPushAction>().HasIndex(x => new {x.RoomId, x.UserId});
      m.Entity<EventPushAction>().HasIndex(x => new {x.StreamOrdering, x.UserId});
      m.Entity<EventPushAction>().HasIndex(x => new {x.UserId, x.StreamOrdering});

      m.Entity<EventPushSummary>().HasIndex(x => new {x.UserId, x.RoomId});

      m.Entity<EventPushActionStaging>().HasIndex(x => x.EventId);


      m.Entity<EventPushSummaryStreamOrdering>().Property(x => x.Lock).HasDefaultValue("X");
      m.Entity<EventPushSummaryStreamOrdering>().HasIndex(x => x.Lock).IsUnique();

      m.Entity<EventReferenceHash>().HasIndex(x => new {x.EventId, x.Algorithm}).IsUnique();
      m.Entity<EventReferenceHash>().HasIndex(x => x.EventId);

      m.Entity<EventRelation>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<EventRelation>().HasIndex(x => new {x.RelatedEventId, x.Kind, x.Key});

      m.Entity<EventRedaction>().HasIndex(x => x.Redacts);

      m.Entity<EventSearch>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<EventSearch>().HasIndex(x => x.Vector); //gin(vector)

      m.Entity<EventReport>().HasKey(x => x.Id);

      m.Entity<EventStateGroup>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<EventStateGroup>().HasIndex(x => x.StateGroup);

      m.Entity<Event>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<Event>().HasIndex(x => new {x.RoomId, x.TopologicalOrdering, x.StreamOrdering});
      m.Entity<Event>().HasIndex(x => new {x.RoomId, x.StreamOrdering});
      m.Entity<Event>().HasIndex(x => new {x.OriginAt, x.StreamOrdering});
      //TODO: add -> m.Entity<Event>().HasIndex(x => new {x.RoomId, x.TopologicalOrdering, x.StreamOrdering}).where(containsUrl && !isOutlier)
      m.Entity<EventJson>().HasIndex(x => x.RoomId);

      m.Entity<ExOutlierStream>().HasKey(x => x.EventStreamOrdering);

      m.Entity<Group>().HasIndex(x => x.GroupId).IsUnique();

      m.Entity<GroupAttestationRemote>().HasIndex(x => x.UserId);
      m.Entity<GroupAttestationRemote>().HasIndex(x => new {x.GroupId, x.UserId});

      m.Entity<GroupAttestationRenew>().HasIndex(x => x.UserId);
      m.Entity<GroupAttestationRenew>().HasIndex(x => new {x.GroupId, x.UserId});
      m.Entity<GroupAttestationRenew>().HasIndex(x => x.ValidUntil);

      m.Entity<GroupInvite>().HasIndex(x => x.UserId);
      m.Entity<GroupInvite>().HasIndex(x => new {x.GroupId, x.UserId}).IsUnique();

      m.Entity<GroupRole>().HasIndex(x => new {x.GroupId, x.RoleId}).IsUnique();

      m.Entity<GroupRoom>().HasIndex(x => x.RoomId);
      m.Entity<GroupRoom>().HasIndex(x => new {x.GroupId, x.RoomId}).IsUnique();

      m.Entity<GroupRoomCategory>().HasIndex(x => new {x.GroupId, x.CategoryId}).IsUnique();

      m.Entity<GroupSummaryRole>().HasIndex(x => new {x.GroupId, x.RoleId, x.RoleOrder}).IsUnique();


      m.Entity<GroupSummaryRoom>().HasIndex(x => new {x.GroupId, x.CategoryId, x.RoomId, x.RoomOrder}).IsUnique();
      m.Entity<GroupSummaryRoom>().HasIndex(x => new {x.GroupId, x.RoomId, x.CategoryId}).IsUnique();

      m.Entity<GroupSummaryUser>().HasIndex(x => x.GroupId);

      m.Entity<GroupSummaryRoomCategory>().HasIndex(x => new {x.GroupId, x.CategoryId, x.CategoryOrder}).IsUnique();


      m.Entity<GroupUser>().HasIndex(x => x.UserId);
      m.Entity<GroupUser>().HasIndex(x => new {x.GroupId, x.UserId}).IsUnique();

      m.Entity<GuestAccess>().HasIndex(x => x.EventId).IsUnique();

      m.Entity<HistoryVisibility>().HasIndex(x => x.EventId).IsUnique();

      m.Entity<LocalMediaRepository>().HasIndex(x => x.MediaId).IsUnique();
      //m.Entity<LocalMediaRepository>().HasIndex(x=>x.CreatedAt,//Where(x=>x.UrlCache!=null))
      m.Entity<LocalMediaRepositoryThumbnail>().HasIndex(x => new {x.MediaId, x.Width, x.Height, x.Type}).IsUnique();
      m.Entity<LocalMediaRepositoryThumbnail>().HasIndex(x => x.MediaId);

      m.Entity<LocalMediaRepositoryUrlCache>().HasIndex(x => new {x.Url, x.DownloadedAt});
      m.Entity<LocalMediaRepositoryUrlCache>().HasIndex(x => x.ExpiredAt);
      m.Entity<LocalMediaRepositoryUrlCache>().HasIndex(x => x.MediaId);


      m.Entity<LocalGroupMembership>().HasIndex(x => x.GroupId);
      m.Entity<LocalGroupMembership>().HasIndex(x => new {x.UserId, x.GroupId});

      m.Entity<LocalInvite>().HasIndex(x => new {x.Invitee, x.LocallyRejected, x.ReplacedBy, x.RoomId});
      m.Entity<LocalInvite>().HasIndex(x => x.StreamId);


      m.Entity<OpenIdToken>().HasKey(x => x.Token);
      m.Entity<OpenIdToken>().HasKey(x => x.ValidUntil);

      m.Entity<UserEid>().HasIndex(x => new {x.Medium, x.Address}).IsUnique();
      m.Entity<UserPresence>().HasIndex(x => x.UserId).IsUnique();
      m.Entity<UserPresenceStream>().HasIndex(x => x.UserId);
      m.Entity<UserPresenceStream>().HasIndex(x => new {x.StreamId, x.UserId});

      m.Entity<AccountDataMaxStreamId>().Property(x => x.Lock).HasDefaultValue("X");
      m.Entity<AccountDataMaxStreamId>().HasIndex(x => x.Lock).IsUnique();

      m.Entity<UserProfile>().HasIndex(x => x.UserId).IsUnique();

      m.Entity<PushRule>().HasKey(x => x.Id);
      m.Entity<PushRuleEnable>().HasIndex(x => new {x.UserName, x.RuleId}).IsUnique();

      m.Entity<Pusher>().HasKey(x => x.Id);
      m.Entity<Pusher>().HasIndex(x => new {x.AppServiceId, x.PushKey, x.UserName}).IsUnique();
      m.Entity<PusherThrottle>().HasKey(x => new {x.PusherId, x.RoomId});

      m.Entity<ReceiptGraph>().HasIndex(x => new {x.RoomId, x.Kind, x.UserId}).IsUnique();

      m.Entity<ReceiptLinear>().HasIndex(x => x.StreamId);
      m.Entity<ReceiptLinear>().HasIndex(x => x.UserId);
      m.Entity<ReceiptLinear>().HasIndex(x => new {x.RoomId, x.Kind, x.UserId}).IsUnique();
      m.Entity<ReceiptLinear>().HasIndex(x => new {x.RoomId, x.StreamId}).IsUnique();


      m.Entity<ReceivedTransaction>().HasIndex(x => x.At);
      m.Entity<ReceivedTransaction>().HasIndex(x => new {x.TransactionId, x.Origin}).IsUnique();

      m.Entity<EventRedaction>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<EventRejection>().HasIndex(x => x.EventId).IsUnique();

      m.Entity<RemoteProfileCache>().HasIndex(x => x.LastCheckAt);


      m.Entity<RemoteMediaCache>().HasIndex(x => new {x.MediaOrigin, x.MediaId}).IsUnique();
      m.Entity<RemoteMediaCacheThumbnail>().HasIndex(x => new {x.MediaOrigin, x.MediaId, x.Width, x.Height, x.Type});

      m.Entity<Room>().HasKey(x => x.Id);
      m.Entity<Room>().HasIndex(x => x.IsPublic);

      m.Entity<RoomAccountData>().HasIndex(x => new {x.UserId, x.RoomId, x.Kind}).IsUnique();
      m.Entity<RoomAccountData>().HasIndex(x => new {x.UserId, x.StreamId});

      m.Entity<RoomAlias>().HasIndex(x => x.Alias).IsUnique();
      m.Entity<RoomAlias>().HasIndex(x => x.RoomId);

      m.Entity<RoomAliasServer>().HasIndex(x => x.Alias);

      m.Entity<RoomDepth>().HasIndex(x => x.RoomId).IsUnique();

      m.Entity<RoomMembership>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<RoomMembership>().HasIndex(x => x.UserId);

      m.Entity<RoomName>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<RoomName>().HasIndex(x => x.RoomId);

      m.Entity<RoomState>().HasIndex(x => x.RoomId).IsUnique();

      m.Entity<RoomStat>().HasIndex(x => new {x.RoomId, x.At}).IsUnique();

      m.Entity<RoomStatEarliestToken>().HasIndex(x => x.RoomId).IsUnique();

      m.Entity<RoomTag>().HasIndex(x => new {x.UserId, x.RoomId, x.Tag}).IsUnique();
      m.Entity<RoomTagRevision>().HasIndex(x => new {x.UserId, x.RoomId}).IsUnique();

      m.Entity<PublicRoomListStream>().HasIndex(x => x.StreamId);
      m.Entity<PublicRoomListStream>().HasIndex(x => new {x.RoomId, x.StreamId});

      m.Entity<PushRuleEnable>().HasIndex(x => x.UserName);

      m.Entity<PushRule>().HasIndex(x => x.UserName);

      m.Entity<PushRuleStream>().HasIndex(x => x.StreamId);
      m.Entity<PushRuleStream>().HasIndex(x => new {x.UserId, x.StreamId});

      m.Entity<UserLimit>().HasIndex(x => x.UserId).IsUnique();


      m.Entity<BlockedRoom>().HasIndex(x => x.RoomId).IsUnique();

      m.Entity<ServerKeyJson>().HasIndex(x => new {x.ServerName, x.KeyId, x.FromServer}).IsUnique();
      m.Entity<ServerSignatureKey>().HasIndex(x => new {x.ServerName, x.KeyId}).IsUnique();

      m.Entity<StateEvent>().HasIndex(x => x.EventId).IsUnique();
      m.Entity<StateGroup>().HasKey(x => x.Id);

      m.Entity<StateGroupEdge>().HasIndex(x => x.StateGroup);
      m.Entity<StateGroupEdge>().HasIndex(x => x.PrevStateGroup);

      m.Entity<StateGroupState>().HasIndex(x => new {x.StateGroup, x.Kind, x.Key});

      m.Entity<StatStreamPosition>().Property(x => x.Lock).HasDefaultValue("X");
      m.Entity<StatStreamPosition>().HasIndex(x => x.Lock).IsUnique();

      m.Entity<StreamOrderingToEnd>().HasIndex(x => new {x.RoomId, x.StreamOrdering});

      m.Entity<User>().HasIndex(x => x.Name).IsUnique();
      m.Entity<ErasedUser>().HasIndex(x => x.UserId).IsUnique();

      m.Entity<MonthlyActiveUser>().HasIndex(x => x.At);
      m.Entity<MonthlyActiveUser>().HasIndex(x => x.UserId).IsUnique();

      m.Entity<EidGuestAccessToken>().HasIndex(x => new {x.Medium, x.Address}).IsUnique();

      m.Entity<Topic>().HasIndex(x => x.RoomId);

      m.Entity<UserDailyVisit>().HasIndex(x => x.At);
      m.Entity<UserDailyVisit>().HasIndex(x => new {x.UserId, x.At});

      m.Entity<UserDirectory>().HasIndex(x => x.RoomId);

      m.Entity<UserDirectorySearch>().HasIndex(x => x.UserId).IsUnique();

      m.Entity<UserFilter>().HasIndex(x => new {x.UserId, x.FilterId});

      m.Entity<UserIp>().HasIndex(x => new {x.UserId, x.LastSeenAt});
      m.Entity<UserIp>().HasIndex(x => x.LastSeenAt);
      m.Entity<UserIp>().HasIndex(x => new {x.UserId, x.AccessToken, x.Ip}).IsUnique();

      m.Entity<UserStat>().HasIndex(x => new {x.UserId, x.At}).IsUnique();

      m.Entity<UserEidServer>().HasIndex(x => new {x.UserId, x.Medium, x.Address, x.IdServer}).IsUnique();
      m.Entity<UserEid>().HasIndex(x => x.UserId);

      m.Entity<User>().HasIndex(x => x.CreatedAt);

      m.Entity<UserInPublicRoom>().HasIndex(x => new {x.UserId, x.RoomId}).IsUnique();

      m.Entity<UserSharingPrivateRoom>().HasIndex(x => x.RoomId);
      m.Entity<UserSharingPrivateRoom>().HasIndex(x => new {x.UserId, x.OtherUserId, x.RoomId}).IsUnique();
    }
  }
}