Return-Path: <linux-kbuild+bounces-13384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB6RDEwDGGqdZggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13384-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 10:56:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5EA5EF0CA
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 10:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D78F3152ABA
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 08:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F133603F6;
	Thu, 28 May 2026 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9kNpqjP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379F388868
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958136; cv=pass; b=Byl8O7EDzQJ80awzJ/sx2Nlob3nkMvSHICWlmrmSt4ic+bwXlnELJZET6jZ3u6Sb8m5OhcecfBKde197FhqWIMp2dfu0DsYEkY8/ZeLh0iKHedMdONZisClnqLvTSa/RvsxonSCZvmOod8OwE40va3SANTks9JCe1jqscRiuR2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958136; c=relaxed/simple;
	bh=VX55HAVTX+x9o5yiREAKP/zQnAuVXaT2xDs9pPVeNqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTdfHlJ2StRyTP1dLuvgfiwizDqexetCr9Rqmi1aextHi4qXKlzlJhcZ85FSfRlBqB4No81SK8EB18r4W6p+eX59vSlJXcXHyOaiPoPHNs0mZAaxMyRbGAbzcMXbdiXL7i+BDmrhV3oqUKPAZ8jpFZjReaP6vvlhdFPTtHy+kRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9kNpqjP; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7c52e49d978so130612837b3.2
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 01:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779958134; cv=none;
        d=google.com; s=arc-20240605;
        b=PqiOBUrwJNrXyEkFx8DsGeM4SYdy0Kl5LOAWCfB4v+DYtKuXvBMJc07h4+3cyIbNEH
         OWOiln28rBZMf7DxrPU9FnXthqHsnveL539CCTFh0YXJq2NbZEnX4kCGIHW6ihPzI2TG
         gViWVHF7fmC8GHI/0XkydHxcB7WJNz/BT0yS4ajyMk3v/G5roKbdHzai2VVKPL2auDnC
         1JGHO7bBIfTOXsLQNZQ1YJ9k6QSil8iYr/4m6AC3fBKyYoO7qCCb5ENM1Hy35OIlXHuO
         aORkrwgY4PrHYaCR1lTdihiO1yIV0xzcy11Ri35GcHqYf5Ro6uAD2xW0Z2RbVdqectV4
         DP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v4QkpuE354+DR4O12JeIFQp+bbtwJrUc+/5QZ9wasDw=;
        fh=qIjC99W6wlKAxJtcTkHecOCE/yEC+jhwE+a2A7ZCUgQ=;
        b=OKrohCw66V5U6oKkoeYai7ipl3Yd9M28QpIzXo33EYH1eejR0VOiECxdsMfyeukW5A
         Dv0MTthOYPeM/hSNZyNPlrMkvbl3vP01L+yaoDgSmI6UY9rCXNKkCuJgbDXbtVC54Rpw
         SnFpwOw5J9HtQDPk4VhH4yjNSUy1YIzqfVIAHYLd8RWlW6hZovpRFwh24MgGhqSJqGVt
         NDk5eQw521xaBtNv+nLoeED4aktRaqQRGwIaAWl0VakudjIt1rvCo5bpQn54hSNwPs4L
         sJfnUgGZAzAYWxsurt2jo8Jeq0lFhuHqKCecX46JjwPyJBChDu5KBtRbMgC/V/I7zasJ
         8jWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958134; x=1780562934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4QkpuE354+DR4O12JeIFQp+bbtwJrUc+/5QZ9wasDw=;
        b=T9kNpqjPZ72slyUMWcUZhO2oLPLHPCvt6dW1Y103/he+1YXLRTohbCGNdmwhjzFXbv
         ee87ejHJpeBvSuqmVFSbkNcAsmpNiYBnXmjmA0M5fz4tUMqXUqjDSjJlDK5kWKNBwifn
         ph0xjG28bUaiYX9g+2rI9JTJr6xWPt1Ho8tcogogFQMsNlrFwDFoWiHTvbu9tgZ9Hc7f
         6sr5Z/12uMQWzEkQLxkJxDoFKHEKDhbRx+wxnOCNrhDNCxLwqEZ1BaURJ6AsMN96jpnO
         ep524AY8Myi1xci7lkLzRnZsA8TIbrElIW4OA6yvSJsH/E3/8G18nJ/u5481YB/6zlRA
         DJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958134; x=1780562934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v4QkpuE354+DR4O12JeIFQp+bbtwJrUc+/5QZ9wasDw=;
        b=eViBtF26pgvbOicRVK6WIHpvigiWLYmNjA3AmmE/OkvyywmSkvA62WnqpLYvgsXD2k
         0Z6bTIdHECAi2x7o/IPKpRgmMfNS3BL1kY7A3dO7Wgvwv/gndfqI+bR2Ln6KM725hmdS
         yEP1MDe8kPSeqjJcQQw3RZD0MZuqjvOdBoOFNX7c4BreQ/Wili5PYg9pRD3DrXcKBG2A
         t4qR2VV35+o3NRMSuEzQHzfs8hOntuiQXGp93pfnry8hW+vChavXvdcPi3wIbrA/AiQL
         HkhG7T/8c0MLhFT9fLzDx4+VPwHIXdsrqyxuJPW92kdbv0aPx5IICguWJPZRDd4iR1sc
         PKeA==
X-Forwarded-Encrypted: i=1; AFNElJ/jwZG4Kw9wKs4tOPLFWjNiK1F7c4mVGidggs+vjTlsT+y4T1mcBj1XF/BujIbtt63AZNjuK8L5xGqirHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYVogKl93VAfQiF/qwWzmwft6dvxeYmodsS9+0wqY6QdHgyh55
	2uBQAZow8Dlll4ZYPSXtTxmTe8RISY+1FYMN646ad1yQ2QiKctOkSt/z+Q1hFDW5YRhnLqM18mL
	flKdHNirbHfS27ZStiEZnFE141IK4bWo=
X-Gm-Gg: Acq92OGAyHqvPEfy2bwLR9KaNVS1LVng0SEiaPELkfkwxtnLQUsUlHNLDHDlC+fSkiq
	UtkZh8BS0tnbG62E//OR88vygJ2WEuCXdkgTFmxNEgW3Q9mg1O/SiMSrK6Bj/qmrIwzKAURoENA
	NySE7avU4TN2rxiGBJzNPDxgzFm7350JHiVqnrfRj0T66v5ZyAA/BAgy2r5LMRKWFs6NEtaH7g+
	Ghzd/CJU6aOQmK4FkaBpZ0CprhJd/nVdei4E8L6k9lxgZLqHRsjkHqHdgQvmtz1vQuSWqhQ0qm7
	tHNJ8elu2ijC6fdxwVpVyf+d7Y9aDXYgqASS1I75uvr1jSi7EI0=
X-Received: by 2002:a05:690c:6382:b0:7ba:fd82:9131 with SMTP id
 00721157ae682-7d33888622amr286976887b3.47.1779958133774; Thu, 28 May 2026
 01:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526062732.84006-1-laoar.shao@gmail.com> <177992899911.893622.3247043690183493347.b4-review@b4>
In-Reply-To: <177992899911.893622.3247043690183493347.b4-review@b4>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 28 May 2026 16:48:16 +0800
X-Gm-Features: AVHnY4L6R8KYElCMmdiLj0RMgg7BFYQ9SsyLa3F0I9mzMz-Ikq4ZJ9_6jFlhYVo
Message-ID: <CALOAHbCiz71ozU6ZDMFsySHKmp9-xPNzMipJf4kYszDDE6xJsw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13384-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laoarshao@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 8A5EA5EF0CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 8:43=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, 26 May 2026 14:27:32 +0800, Yafang Shao <laoar.shao@gmail.com> wr=
ote:
> > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > index b3c956205af0..c732415662ef 100644
> > --- a/scripts/package/kernel.spec
> > +++ b/scripts/package/kernel.spec
> > @@ -6,7 +6,7 @@
> >  Name: kernel
> >  Summary: The Linux Kernel
> >  Version: %(echo %{KERNELRELEASE} | sed -e 's/-/_/g')
> > -Release: %{pkg_release}
> > +Release: %{pkg_release}%{?dist}
>
> This seems reasonable at face value, especially since Fedora recommends
> this for all of its packages but the value of dist will be included in
> the version string with how this is currently written:
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 RPMOPTS=3D"--define 'dist .distval1=
23'" mrproper defconfig rpm-pkg
>   ...
>
>   $ cat include/generated/utsversion.h
>   #define UTS_VERSION "#1.distval123 SMP PREEMPT_DYNAMIC Wed May 27 17:27=
:34 MST 2026"
>
> Maybe that's fine (or even considered a feature)?

I believe the current behavior is fine because the 'dist' value is
properly displayed in the `uname -a` output, as shown below:

  $ uname -a
  Linux localhost.localdomain 7.1.0-rc5+ #1.distval123 SMP
PREEMPT_DYNAMIC Thu May 28 06:25:23 UTC 2026 x86_64 x86_64 x86_64
GNU/Linux

However, if we apply the change below, the 'dist' value will be
omitted from the `uname -a` output:

  $ uname -a
  Linux localhost.localdomain 7.1.0-rc5+ #2 SMP PREEMPT_DYNAMIC Thu
May 28 07:43:05 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux

> Figured it was worth
> pointing out in case anyone can think of problems from allowing this.
> Another option could be just changing
>
>   KBUILD_BUILD_VERSION=3D%{release}
>
> to
>
>   KBUILD_BUILD_VERSION=3D%{pkg_release}
>
> to avoid this.
>
> --
> Cheers,
> Nathan
>


--=20
Regards
Yafang

