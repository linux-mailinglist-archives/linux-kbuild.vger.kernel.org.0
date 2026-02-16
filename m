Return-Path: <linux-kbuild+bounces-11319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDXWOofUkmlMywEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11319-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 09:25:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E3141858
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 09:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5B66300953E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 08:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F1D2DF134;
	Mon, 16 Feb 2026 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCvt60SH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZukPKZ14"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14F227EA8
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Feb 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230341; cv=none; b=fiK8bHBpYsnV/wqS7e45zr7y9WlplAf2VhLR6P2KzUkdVmtglp5O8N9oy7U60EzKwr5CSDMCf6FTe8xQliy80c5tqkhZ8GvRInsFz58CtXtaJt8dG4BQh5iRdOrLyMrAHnNATUBZ/kFHW4v8dvMFMcugx+jWcoZcXiybr3uDesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230341; c=relaxed/simple;
	bh=nInKCgIP+A0LTqJCkbRxrySrnisfW77dFmLRGjVFfwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFwzXOtKjU1qT4ny+3VsqVJHe4rDPsWDI2pDIwIRi8YmBvvjp7zpgAGqB6Z9nKNsaNIEuMNRWdqpucYctDzx/t6wLING2WVITSuk7fZCsU/JqyllNZXKcRd+qly6AoUCvy08HULDCpmyoMk9nOMSXMi59kALTVatv/Qhg6Mop7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCvt60SH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZukPKZ14; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771230338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTyr5ePnFbB0QkSaBB5Ia4C9W9pTREiW3R9ckzEINXQ=;
	b=SCvt60SHEDHYpYtcJGao//m8xQ01U2eUxnqQzPgDEDFb/W9DDs3AuoZJE+Ooq7wOElXiVV
	evZpHgfpgpinTuSNqHdAeT0YJCp/Vt9TJtPaU/hvzd4n+LEdP26mu+8350Bhi0EmP5BIMg
	iRBL9K2u4KtMGUvk9DUZe3zgLryTF3A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-mUF2K8BEOn60eycywFAMWw-1; Mon, 16 Feb 2026 03:25:37 -0500
X-MC-Unique: mUF2K8BEOn60eycywFAMWw-1
X-Mimecast-MFC-AGG-ID: mUF2K8BEOn60eycywFAMWw_1771230336
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4806cfffca6so36437865e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Feb 2026 00:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771230336; x=1771835136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DTyr5ePnFbB0QkSaBB5Ia4C9W9pTREiW3R9ckzEINXQ=;
        b=ZukPKZ14dE4BWjimW2qGgAt9hmnF/7esIloQHYp2TGUs8zdy7FNR7Eh1xLMQQhZqwt
         Iim/Q5njlU/ITL/R0jNIoKobT5Qz8zR6xErBzbp5snkSSgB0fVDkNHFSM349pvuqTYFo
         DbBM1rvk8QMNcppes6D2m5CoxyBuQK5QGBCzemQn9o2ISyQftmKOeB/M+MafuuUfqLXX
         tNHTXqh/tVnK+Xp/spdKhYcMNHdOQC1ZBvrR9pWgIt8hvckX2xtu8+9SU+Sg1cbqpaud
         0eqYPqZOW1NZq9HtRRHHJzKIAZ9L/TA9B/OT65XNsvIdvUT1zN2lsFi77ARqBikzoIqd
         k1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230336; x=1771835136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTyr5ePnFbB0QkSaBB5Ia4C9W9pTREiW3R9ckzEINXQ=;
        b=a3Somu7PDBsv4RqvxZfPA5gMN2R0HVvS0sAXbPBov+tZSJ1mkUZ8ecF1tXyoQr1GGW
         gKgADwYzqJWBeu/SevCuUxHeTLGP+/4xQO3szJMlbXRK+4PqHykKZ2Ut79R2DlZaNodc
         a3ke7vmI4w0CWrs3FRv4dmLG8tQVBDmBnrJ+p/L/u9/gRqlkSpGHWHmpC908+CvCY8qg
         DWTEcLzAj3V8PfifnN9KYvGgxpNFR5JSBTJVr8F3pqYLzSiNIYCAnwftw+1UBLEX9yIB
         rnENQ47WtYc33lo/Var/0lpq6vtIWQzq7sPFeAhsBJrJvE6ZLUV9kkTdebv9gPGFbAOS
         VGrg==
X-Forwarded-Encrypted: i=1; AJvYcCWukRSn6sg623+aCvnNKRmiD+JPyQO/g7HVUK0H52c62/dFDhvhjkO3akWW5z10CKOlMvB2WaGyP0NLfsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJed+KmY+DlERTsEME6vX1qp4rjMVWyqsLDkF8fzgFGousdwP
	ZQmpBZnIlkIB0tnYGFjxre/aspfKINg0lhGPVwqr/gF+6bIl7p+z8V53KLfYsKJC+QBxQdgNbTm
	smVUxNlAPVt/0cHaGaGJNwCbbjzazzp8qNexv6YqqnrXJyp05pzZ75/IDc0jLyLlXuw==
X-Gm-Gg: AZuq6aJiXTZsSortOZNIYeuemAYcDA1uZaiPuFO0V+ZO5LbSFuEKpqwZOIJ3SiZRTha
	t27nInEmVyf17yizeXVj2a6cnhDBzu5k80uJMZaiGyhmQHh+qYJlDysXlcG4ID6aldOUQUKvBF5
	9v5BGRWBSaXmH7R+RQUW4D89lx2mMqXT6rVDVDEz6Poi575SAKONvkxpozfXUe39BWhjM4lNBD7
	ryd23KEJtJkhWMqxTLI2PrwKCeQcfTtGvGiGSMei7NUTMbv8fluL5PllSm5KjDR5FT5DkVoVCzs
	rh9wRKgWb2QD9+5RdHrif/akWx/3xWbqGDLJWweGEo8xux1Rz7b2H7fDgac9j/2spxHqmfeXEVu
	/L102QiNAjLzIRwGrHSRUs6YuGLkJZSuk5YpfHjiXdElJJ5HSRVB6i/6UMTnUCNbBKA9Itx8=
X-Received: by 2002:a05:600c:190c:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-48373a59a74mr134122885e9.32.1771230336331;
        Mon, 16 Feb 2026 00:25:36 -0800 (PST)
X-Received: by 2002:a05:600c:190c:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-48373a59a74mr134122665e9.32.1771230335778;
        Mon, 16 Feb 2026 00:25:35 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a298b5sm78451155e9.12.2026.02.16.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:25:35 -0800 (PST)
Date: Mon, 16 Feb 2026 09:25:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <aZLTsduMY7H-QoA2@sgarzare-redhat>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
 <aY8wyR572eZYWVJY@sgarzare-redhat>
 <20260213191138.GA2131983@ax162>
 <CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com>
 <20260215212901.GA695045@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215212901.GA695045@ax162>
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
	TAGGED_FROM(0.00)[bounces-11319-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 570E3141858
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 04:29:01PM -0500, Nathan Chancellor wrote:
>On Fri, Feb 13, 2026 at 08:41:24PM +0100, Stefano Garzarella wrote:
>> mmm, that it's odd indeed.
>> Without this series applied, I had issues on Fedora 42 (RPM version
>> 4.20.1), but it worked on Fedora 43 (RPM version 6.0.1).
>>
>> I just retried on Fedora 42 to build commit cee73b1e840c ("Merge tag
>> 'riscv-for-linus-7.0-mw1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux") and I have
>> the following errors:
>>
>> RPM build errors:
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': #�) = 0x0d000002
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x47161b0700
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x339b1a000ac0
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x36000000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7508200000000000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e76000000000400
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x803ab2b00000000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1a00000000005e00
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x125590000000060
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': = 0x03080000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x818000000003600
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': $) = 0x1c01040000004d00
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x63c300000000000
>>     Illegal char '?' (0xffffffd8) in: 3�
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1320f691700
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e17101500
>>     Version required: ksym(g) =
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': p) = 0x3875480000005c
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ]) = 0xfc22000000003000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': 2) = 0x5d0d03cc22
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ]) = 0x32042c1c
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1c11a3d1b00
>>     Version required: ksym(�) =
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3220312e322e3400
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x322e353120295400
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x2029554e47282000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Illegal char ')' (0x29) in: (GNU)
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': #) = 0x031c0000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x570d03ea11
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 
>>     0x4000000520d03c0
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': C) = 0x690d03cf33
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': �l) = 0x102000001471140
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': i) = 0x4a00000000011000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e00000000240000
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x42111503a533
>>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0xea1303bb33000000
>>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>>
>> But if I apply this series on top, everything is fine.
>
>Okay interesting! I have not seen that error yet... I wonder if adding
>'AutoReqProv: no' to the kernel-debuginfo subpackage (like the
>kernel-devel subpackage) would avoid that for rpm 4.20.0... Probably not
>that big of a deal if it is resolved with rpm 6.0.1 but it would be good
>to avoid as many corner cases as possible.

Oh, yeah, I just tried the following change on top of commit 
cee73b1e840c ("Merge tag 'riscv-for-linus-7.0-mw1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux"), so without 
this series applied:

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 0f1c8de1bd95..86ca327ebccf 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -50,6 +50,7 @@ against the %{version} kernel package.
  %if %{with_debuginfo}
  %package debuginfo
  Summary: Debug information package for the Linux kernel
+AutoReqProv: no
  %description debuginfo
  This package provides debug information for the kernel image and modules from the
  %{version} package.

And I'm able to generate RPMs too without errors!

Thanks,
Stefano


