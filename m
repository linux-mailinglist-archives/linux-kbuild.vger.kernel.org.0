Return-Path: <linux-kbuild+bounces-11321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCehGiYkk2kX1wEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11321-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 15:05:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E01446C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 15:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2566E3040199
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 14:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FF6310763;
	Mon, 16 Feb 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vpl+q/JP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+kdCqlA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E584C30F95E
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Feb 2026 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250633; cv=none; b=sBwUu5VO97kQ3p+yyXE8kfCwWEmNlmNXJZ1hfAaMS4VvYZttPzMaNYqeH9Jn+1BqGv7iO6V3/hkSc9EVZYxCzQkDrbhzXJB3rnjquaCOhNJ6lWeRPbVZw+YUSa2MfcsjBpdFr9eT5Wd0eo/JNbq71kdTYK6y6YH/b4I5FS4ybt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250633; c=relaxed/simple;
	bh=qvgtxZHIyxGZTtSdGu40CUd9mGNaZbI8z3wr2u95YMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5qrpS4Zu5XyRwhQdCY/ta5K4cLUrFxoSmzvaGnWRziTRlxIWFD+9h3GHrd8HStEEzVDR3W8XcMqOsTHCgY3okDVD0cz0Ln3aX7MYXT+dsoOiPBw8paRizODt1Pio9FEt9junvXBcrUhXIkp751tfTmrGN9PFKKGrER81GeAOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vpl+q/JP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+kdCqlA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771250630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wgbev9M35IzSPMmROskqj3DwY+teLZJngKA0ChkN4m0=;
	b=Vpl+q/JPS4WskW+Wm3theyju6gURly1ozw6P0Kq5Q65c8mZ4x6yyQzKK2dYyhyJ6I0mWtO
	Y7b2lKEzV0HFenthgtzorkGUZK6mkj5/kNiSMD49Ry5/j/3U0QznA29qU76M8SoqaDGIqZ
	ytdKjv88XY7j4CBxYDTE8f0Uqvk3/ss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-AMb8BnxqOue8e2BMdNWHNg-1; Mon, 16 Feb 2026 09:03:49 -0500
X-MC-Unique: AMb8BnxqOue8e2BMdNWHNg-1
X-Mimecast-MFC-AGG-ID: AMb8BnxqOue8e2BMdNWHNg_1771250628
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48070c21420so38404495e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Feb 2026 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771250628; x=1771855428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wgbev9M35IzSPMmROskqj3DwY+teLZJngKA0ChkN4m0=;
        b=Q+kdCqlAZX9WIgeIsK7AWumSqG0DOay+h4Szrpxcp4ttKXMJRbVu1x8sA2KuE/6xRP
         kfxMAj84cOPX8H6CJSYgbqYJlhNaA/iHg6rpJRtWCl0SvpWvLG+qYuD3HZkn4N0oeN8S
         U45Gd0zxJpF5eHc6M3Sd7kynlfuv3ec3SCkPw53kvfBo3hmkDmtEEDBcrrr/hvTQIkWP
         mrME22zmBKCP4eeKphGjVyA7zZmqgBhnE1eDMi46HGy6elwVSCtzCO8DyHugE2lHNZj3
         oTRw6p1+FSc+kdsOGLG+OUmgg/lPImNNAEoNicWL9Qu8YOF5vZsIENyjeN0qvNP9DcFl
         Y4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771250628; x=1771855428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgbev9M35IzSPMmROskqj3DwY+teLZJngKA0ChkN4m0=;
        b=pTUVunYu27IYsjsFIGDaDRqoLjSHrk+W8pVuW7zXHJerJSYZAoSZEI7RudO1eUDuUN
         JfJDpmEHn4mO6/MRdm+G2xfpsZOMbBRdgztik4fAr8bPoqNV+HxedqgUxRhgKN9lm2gJ
         DxZvCVtTjDCG1uE7NzV9Ovbs6Gdg6eQU38YvAVTAcGKcgOi/a9rmMRRrT3M60E/ENixJ
         zZZlqJmp9T2mIB4TlFAoUuMtoYpBXDaQkn+SEP6a66s/ruwu4Me/AdGYZsTn9n63gbVP
         Nl90ji8DwX0FCJiGoyh78bNuuRiDt0QRYj99JbB8m4Kdd83mMIyXJycmvSF4rRQ8kDAQ
         2KTw==
X-Forwarded-Encrypted: i=1; AJvYcCUa52CPL0ALR9qRAl5CnUN+yCLK4LgeCHyZfITvkmE9W0n81f4tD0G6b0a6ffwIj6lymOPsXSXg3wsUt0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6LPRvSlPUoO6xxM3KuYNvgApC3ySN4yq2dIqPU/+6i8Ps3+t
	pklxtL7lRPGbU1pwsN3xz52UHsSh7kMBEuYVfZ08oRU5R3776A7fjuJDoOiqHvb5pz/ZTwAGnQB
	tbJDNtht66xw32dlq13ykTrNfWXdctB2UrP1Hx+xdzUMWBn18K0WMFxDP3/t7erqcTw==
X-Gm-Gg: AZuq6aIOJwe+t4erEI2NUlj+mOacHeIiq01ka5r1Zc36lIMLa5zMfS6E5RHQueOmik2
	0M92/YnJ0HzWeOuaZWE90ezp2AF3vPc68JuwN0E4VNRlMh3S0ly/BGovRnoJE125oUF0ipkW3tL
	D2uLZQ7B2ecGVI5brr06ZFPhHENjqqznfuuF8fK0gmeIenhwPTtLfp0tNYKoVLn5Z0+AWjzO71l
	sO8T0t0gpREDHjxdcsYnr6Hu36HTaX+nwSRsdzTxLedcxMmJsHCoTJx3cXXV05AUYqzofnCy6o8
	rky8kCb+bI7Ac/ZlfSx9yuBlxSDu1gJe5oMaVtRLFUTdnFJPgUskoCJNWSSAlRvFd7lxNM7oJRv
	D9qCvoMVUPpGwWlYrM2wLl+DIIZcOWlPASL8zNxu92sPV9W6B2gX9NBvnaXjPWTYeswi2agk=
X-Received: by 2002:a05:600c:3b87:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48378da53a2mr143994845e9.13.1771250628164;
        Mon, 16 Feb 2026 06:03:48 -0800 (PST)
X-Received: by 2002:a05:600c:3b87:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48378da53a2mr143994065e9.13.1771250627605;
        Mon, 16 Feb 2026 06:03:47 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a02a79sm180910655e9.3.2026.02.16.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:03:47 -0800 (PST)
Date: Mon, 16 Feb 2026 15:03:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <aZMi3Sg-7Z6IZ99d@sgarzare-redhat>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
 <aY8wyR572eZYWVJY@sgarzare-redhat>
 <20260213191138.GA2131983@ax162>
 <CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com>
 <20260215212901.GA695045@ax162>
 <aZLTsduMY7H-QoA2@sgarzare-redhat>
 <20260216114227.GA213868@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260216114227.GA213868@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11321-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sgarzare@redhat.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD6E01446C1
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 06:42:27AM -0500, Nathan Chancellor wrote:
>On Mon, Feb 16, 2026 at 09:25:25AM +0100, Stefano Garzarella wrote:
>> Oh, yeah, I just tried the following change on top of commit cee73b1e840c
>> ("Merge tag 'riscv-for-linus-7.0-mw1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux"), so without this
>> series applied:
>>
>> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
>> index 0f1c8de1bd95..86ca327ebccf 100644
>> --- a/scripts/package/kernel.spec
>> +++ b/scripts/package/kernel.spec
>> @@ -50,6 +50,7 @@ against the %{version} kernel package.
>>  %if %{with_debuginfo}
>>  %package debuginfo
>>  Summary: Debug information package for the Linux kernel
>> +AutoReqProv: no
>>  %description debuginfo
>>  This package provides debug information for the kernel image and modules from the
>>  %{version} package.
>>
>> And I'm able to generate RPMs too without errors!
>
>Great, thanks for confirming! Does it still work with:
>
>  AutoReq: 0
>  AutoProv: 1

Yep, I tried this (compared to the previous email, just to be sure I get 
you):

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 86ca327ebccf..f5d0fa34c51b 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -50,7 +50,8 @@ against the %{version} kernel package.
  %if %{with_debuginfo}
  %package debuginfo
  Summary: Debug information package for the Linux kernel
-AutoReqProv: no
+AutoReq: 0
+AutoProv: 1
  %description debuginfo
  This package provides debug information for the kernel image and modules from the
  %{version} package.

And I'm able to generate RPMs without errors.


>
>as I notice that is what the %_debuginfo_template in /usr/lib/rpm/macros
>uses by default. I suspect that the automatic requires is where things
>explodes and I think we do want the automatic provides because I believe
>that is how the "this package provides this debug build ID" generation
>happens.

Oh I see, I also have:

     #	Template for debug information sub-package.
     %_debuginfo_template \
     %package debuginfo\
     Summary: Debug information for package %{name}\
     Group: Development/Debug\
     AutoReq: 0\
     AutoProv: 1\
     %description debuginfo\
     This package provides debug information for package %{name}.\
     Debug information is useful when developing applications that use this\
     package or when debugging this package.\
     %files debuginfo -f debugfiles.list\
     %{nil}

So I guess I tested the right thing and it works ;-)

Thanks,
Stefano


