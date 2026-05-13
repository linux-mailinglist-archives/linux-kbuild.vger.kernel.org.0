Return-Path: <linux-kbuild+bounces-13132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL8uJ7hkBGq6HgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13132-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 13:47:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 031445327EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 13:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F2F73086FF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 11:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CA438D6AD;
	Wed, 13 May 2026 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enakta-com.20251104.gappssmtp.com header.i=@enakta-com.20251104.gappssmtp.com header.b="PSh6g80k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F339AD32
	for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672750; cv=pass; b=CtXT1+mIQT3EUgBqj67SsIqaIpooeLKECDDkjEAI5K8jwEGVsDp82BUaGk6MeJMGXFQyehRPbb7hdOMZm9BgObx/KF7vfSIn1pcESg5MFx29K7D1xEzde6bhKiFG/YrFeAxDas9kX/sU/PUoCEbZ6KG7GOVAPoe/bVsRJfVf9Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672750; c=relaxed/simple;
	bh=OCJVZ9t0cA6gJISiESruJqN1hqsmmd1ukxjNi7yLY5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFsE19/KQ41Fi6Lw3JJdorxh2vczpcbPJw3Y5ujT9VhuOvwEQl+Wfn7K6x9xDNm9SVtUeWITtePyr/OxDltXrEpmEC0FnNRmH20NaZDRiERAhl0I7LtqM9k9XmwB6O4+rO9QiLPmHIErEH+mKLitAYFI7asVy8ThpciIZd3y3Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com; spf=pass smtp.mailfrom=enakta.com; dkim=pass (2048-bit key) header.d=enakta-com.20251104.gappssmtp.com header.i=@enakta-com.20251104.gappssmtp.com header.b=PSh6g80k; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enakta.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba4efedbeaso46936955ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 04:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778672748; cv=none;
        d=google.com; s=arc-20240605;
        b=luqDmwgFElbTvVLQejncUT2SXY7Tg0f9MTydIJaXxKNGNUMRI9GBUvcMa5dXK2IYK0
         OY0LTongI+4PDDyIIMMj/76cdWv0SPKb7KxQ0sgqq+tNK8cBYKy3LXxx6bLh/x8cuR0y
         7iE/Fa+BN3YkRimVX+vQHBxR8A3F1boIPFESczKQXStcI7H/3IML4KF+JUbNN2THKRzk
         IklrFNrfmZ7OEHXe+eaCs26cLNz2XU78KQqdkN4ZzvCLER1tt8VzZWCrdx5l5SoyBCp3
         VQCGMlgkuTVqYvowQervzXa+I3VfPCg24HlOhSV+N/PI3F4HXU9KM5kkH8Q84WbY0lyN
         qduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OCJVZ9t0cA6gJISiESruJqN1hqsmmd1ukxjNi7yLY5I=;
        fh=gz3c3+zeFWmvry4ii7PzW2jftbNe3FbyOyAOUvDMrzY=;
        b=X24E6RgRTodTQs9ORGfp6wDSHwMbfXOjgn0u/5NSV9Eof3bw6vZSweNdgwe/nc+yLL
         oM/EBqvec9Uw8cG9zFFAHdyZ3i7pwjdB16YG4tFLgB5EzKfVF0nZ2yflhPZlFiEKGeH8
         tefB0SdIYvbnFOG6kpZWATu1HaMz/jgg5he+er+HewEVNRW/lf/y7vD+VMbJWfAE2anB
         OuX06c1ObnoVCmhd5AXKaRdA5rnvoSx4g7F+wCF9wCiWUtgiYHo58+aQAXJSzSCg5jlL
         EurVU1xRo5X2jPlsNSHb37jo5TPJRIusM2dK0H3u7HkiIeivzy0OOsGvgU9PeB5aDUeL
         Llig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enakta-com.20251104.gappssmtp.com; s=20251104; t=1778672748; x=1779277548; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OCJVZ9t0cA6gJISiESruJqN1hqsmmd1ukxjNi7yLY5I=;
        b=PSh6g80kifnmmIxLSTMkhURoIa/QMdzoqVnrOdg1+/SdzbI2/FFWSdSvxHketbfhE+
         VJ2UyfmjkBqCav4Wgrp7MTNYgH4wPvs9Uc+lbwKoBFlc3okokWEbyNQPW3OHbPh2EDHQ
         +tA7/hbt2Gp0p2Rv8xNFYzdh1afNDZPJ7YiK0OIx0GMN1WISY3Met7A5ygVPNk1HmXQd
         4gmGu4fWTt73N9tKJywlSByFt8CDM5xzE3yL7yseQeWxc5RZEvKF7OCHNzzJibc7ZOol
         ut3o0zKsQvosm+zwHr5xYmKE16FUvfZ/p8yrB12Iw4j4rvT4dZYly7bJQHnNOgyNzoou
         40QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672748; x=1779277548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCJVZ9t0cA6gJISiESruJqN1hqsmmd1ukxjNi7yLY5I=;
        b=qkvGxsvoRRyvL6dHSU4t2x2kk82PpXYFwtVLvJu+BQQVhBjbl6Zrf/JQnMs6BC6pbn
         EUGmUFVgHg0Y+D0dr+7O6nKtZP3hwms5EDgGxi9jgQWUjfzvz9skwyL4w6/xy7OU2FUo
         JTGFLaHczQoafcHCg010LJ5ndA1LgTJCi5geuaWn0q607O3gcnNZivvBKpzN1rbpH7FG
         X4RFbGqb/Nn6BpNYqt2nLNGFLrGbXVBnWsBS38Qellnu7j4IFyvAfQH9snqtjRKGo+9L
         1MBwPuACPBM19ObVk7L81eJBNNiFDyaKjnuRqWXb4jlijutu83aAELqcKQ5n8Y6UH0kv
         H9rA==
X-Forwarded-Encrypted: i=1; AFNElJ9PP6ev+EWDzgAcL7QaIJeNfX0JxJJDA4Xx/+kPrhuw7gg8HlNOghz+eGvG1pM0mGn3sIDyJ+SRJ7I+NEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6ESN1+hsFPaf6t8bM9hPKc3QB55D4RvWGFucWSt7Nvtgw8EU
	ldc8JJKH/8WCOSaRPVeU71HzK0FoIVPK5oRtQ6ZsHYdOgLUr15MMngEKdK68oWvt3SjeFmRIFJC
	8ehgL2IfQiQbg+3KDv9vl1LpYHGlkfiW41O6cuTs1+OqGNWCLBiW/xcM=
X-Gm-Gg: Acq92OHFXhionelt6kphBZCcns45ETZNlvXzlp74sjzPLEsQUVtvNNQJ3iubGc8Q11g
	/YHSX6wxAXARJJG0yU7ed3jKNpKKsHCHTpczc2gTIrc3nIVeLXNVWtC+6B/7Iwj7svHYTPbFr9J
	M8bMGNYSd/ATaDzba7df+iCV7obf/GoAqsAmikR35Eb3At+LBgaR4DIxKnr48m3/7PW3RJtMcUf
	WaVF7uRfz3PifI7f4ebrtaKq4oi7dIV7REHbwqLl1F7eBXsTezRVF4yk1SmvIKjUeYUbf2UL/sf
	LYS1t7sm0ZhC8YeD9hsOJEEVUXEHT5JNz8zCILOibQJs0aTmUJvmG5qI6nH4z2ZPe69j
X-Received: by 2002:a17:903:2f4c:b0:2b2:4bf9:1766 with SMTP id
 d9443c01a7336-2bd304346b2mr28880595ad.33.1778672748196; Wed, 13 May 2026
 04:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <2cb12a60-32f1-4656-8a9f-305bd0be069e@infradead.org> <c7fda6fb-5095-4fd5-ad1a-22319bdf0d4b@infradead.org>
 <CAGk60SEw7xgSLc5+5EhgOnZkC6PTx-N98R94t5jQZ4wZKRVfkg@mail.gmail.com> <a1a8c33e-6e2c-4766-b7d9-b393204ea373@infradead.org>
In-Reply-To: <a1a8c33e-6e2c-4766-b7d9-b393204ea373@infradead.org>
From: Denis Nuja <dnuja@enakta.com>
Date: Wed, 13 May 2026 12:45:35 +0100
X-Gm-Features: AVHnY4KlvceH8GFdr9uIq5jDgAkNyz7qWuI32gmm6wzkPnR7a_Ph0dgkMunoo_4
Message-ID: <CAGk60SHx6e3cScvqWFLTph3ZmuzvmN_eqPu2DG79mDGLib1ypg@mail.gmail.com>
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-cifs@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stfrench@microsoft.com, Ned Pyle <ned.pyle@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 031445327EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[enakta-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[enakta.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13132-lists,linux-kbuild=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnuja@enakta.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[enakta-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,enakta-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action

I would like to thank everyone, we can see that
https://github.com/torvalds/linux/commit/6acc747906c5 included a fix
for this issue.

Hopefully, distros will have SMB Direct enabled on the client as they
adopt a newer kernel version :)

Cheers

Denis

On Thu, 26 Feb 2026 at 01:36, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 2/25/26 3:05 PM, Denis Nuja wrote:
> > This was tested on kernel tree of SLES 15 SP7 running
> > 6.4.0-150700.53.31-default.
> >
> > Randy could you please confirm what is in your config for :
> >
> > CONFIG_CIFS
> > CONFIG_INFINIBAND
> > CONFIG_INFINIBAND_ADDR_TRANS
>
> CONFIG_CIFS=m
> CONFIG_INFINIBAND=m
> CONFIG_INFINIBAND_ADDR_TRANS=y
>
> >
> > in default builds of SUSE (and probably ubuntu i will check) it is :
> >
> > CONFIG_INFINIBAND_ADDR_TRANS=y
> > CONFIG_INFINIBAND=m
> > CONFIG_CIFS=m
>
> Same as mine.
>
> --
> ~Randy
>

