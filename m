Return-Path: <linux-kbuild+bounces-11308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJFzD5d+j2nZRAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11308-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 20:42:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826D139429
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 20:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACCBA3061E1B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 19:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130D927E049;
	Fri, 13 Feb 2026 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiPMwTWd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fVPJafXq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C8246782
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771011696; cv=none; b=NluP28k95UXJb4r5JHdxfXId/VQ6yv6WdCnOdbm+Ei0J1HL8j56/l7JMIBxMu2zRaFmulSDj5pz0XbxM038aLiz2KTDaC4AK1+B4Vmb79+6iILQRo7+3uwkQCLoUXXAk8YEnke+wEv4UmNEIz1PSuauwerBqYxR2KK2v61bK05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771011696; c=relaxed/simple;
	bh=0vG8ZqU3sCAHwpU6tE5Q+ZCkwGtFet0/lGXw0pw2o9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWnVvdjYqMDHtlrYoNAxd2xuwrLccPLZibq/JLxPHHAryBDq9EvP1B1WvmwnTX1SU6y5lCxB/9/QgiafnZNoUaMaQnO+YXw+zPfQJt+hL56EoQF40Kb2WdF+ZZ8hHet1nVD/1fkg5EX3k63KByAuksKK7bNVUVIktgC0FOz337U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiPMwTWd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fVPJafXq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771011693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNPXiBDvtas/vaXtolVa7cVtITG/UHp7HfnL+g1+92o=;
	b=NiPMwTWdYwZuqWwJk4WRGl2M/Fauj/5YR7dtCahTs9q2uJkA+NvPWueBjPuXYeD3+W58Ha
	qYZ5J1AdWMj5pszNHPLf5DyZ8U1VVRba4qFJ7vmv1I6loyGVLTmQHr+aC8yeb5FjSfN7SE
	vi7RfMDACETNm8TV0QleXUAWrFX27OU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-dq6Cjo8OPmKwo6D4RyyzmA-1; Fri, 13 Feb 2026 14:41:32 -0500
X-MC-Unique: dq6Cjo8OPmKwo6D4RyyzmA-1
X-Mimecast-MFC-AGG-ID: dq6Cjo8OPmKwo6D4RyyzmA_1771011691
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-483786a09b1so11121255e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 11:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771011691; x=1771616491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNPXiBDvtas/vaXtolVa7cVtITG/UHp7HfnL+g1+92o=;
        b=fVPJafXqSDm4Zmj9TUoUbpe9iVthcun8yUAivdFwf9+YoTwFjrucNgkRxulpI8VdQx
         ZKNax3D8JMV4d3ucyaBt9aNph8JxwO97ENqSruXffuM91UyAzs5+y3AJiP8CWSEwkq//
         g3smCLpkZU82l7tmYMAr3nIW+okQQa0F109EIRGBTL/Qg9a/7TcbUSkzgEyBcjUpYngL
         beALH00EaM17d6T+kownHmgiBcQEZfVoK0lvLvr5gJmmRiOSlh4xXShT8LYEXOqNPMGI
         sEvxuGbrVCrn30YtYL4P3iMSiSJoYjNAHwVaVRbTeV6jXS1sTIJmXzIEngC07Kvm5K5j
         5PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771011691; x=1771616491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNPXiBDvtas/vaXtolVa7cVtITG/UHp7HfnL+g1+92o=;
        b=iavvWgug9jGfNY93XjGebZ12VDJb6l/Msay2dNhHXerjhlAks0Z/9eOPUdc4/i6I8w
         WGuqK2uchlRzWwmEclnlTqRwyejnC/3/0ZUQ0AdDaiBEqxld/VlYKIoFLoP7EHeXO0k3
         efMM6JlpIqzcAkdoZ960o8lOJa3EgFFyBTuNDgj3ZcFArKqrXULiVmqrsrOkWY34Fqoi
         ak8g2K+j3VuG2sGvuEfCfsWtbIokBvX24QYCiX1tqpfto8UWSPiwRBfcsHv+zIJ1eruk
         Egnt+ZUHrFHjVJpSgcjnI+ucS/JACoM2LRFU1vo66jl/uanSMA6nwNtpu8Oh8q7j7IFy
         FfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAdzC87wlP5f+P0bYQeJWiJFxcD7k9G3LSICayaV+v2oF7H3YfwlcJ+V/kNlU1Ht7ZxFZLEjxv93cjdUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqmf86nxCm4yNppJQxtuh+NEhcR8sPWTMPLOzwObnNc0JvcYnU
	iucxZwz16OhPvE+VzRhTaNb3Wo/pv35uR0Q4Ex8xQ6mmPbH4kBQmXr3XE8Sk+W/XzrTXSyKkKH1
	D0SUoZ/vEcJD6X8iNGGkc10fehpKwnSvnM+/nycIRvbgiFm2vlo7INc9KzgczCJtaE1UBCbFRjw
	==
X-Gm-Gg: AZuq6aJXSVArWWpVVULy4QkVoCDg9NmI3oJXMh063/5xzBN9UgEl96NG4zzdEc57nie
	zKoh/KFJqZaSxW7GXpVES+6Q0a//GrbB54yyhs6p+07mKo0B6zM2H9ncI8zZYIUjXWPgv7ZjJZN
	JASKjL8jUE9IfMuLGDA5qADt8qubrJC5KRxFKJKC6vzjOUFhZoOAsOL2TssU7dC2OFUadiqzlny
	3CKO9uiV1Dt7xo7e7pNp2eTWD/X+ADO7Svvkp8tP5WyWFb1Cny1M7ix9LF53osuWMJv4lIlsbX3
	qbNx4oIRMZRc7mudNYFCKV6mN8Ci1s/UwUfZ61IgPMYdSf2Guq+9c5pccBuV82rHJWSAroEr6Yx
	aJX2UfBvk9AEiqPpa7DLdSpL8EAH0ZgUWPPyxB99nV4qYRTLDyFejtW/9ycEBymMUZp9Qt/Q=
X-Received: by 2002:a05:600c:1e1d:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-48373a15f3cmr46613505e9.5.1771011690975;
        Fri, 13 Feb 2026 11:41:30 -0800 (PST)
X-Received: by 2002:a05:600c:1e1d:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-48373a15f3cmr46613075e9.5.1771011690457;
        Fri, 13 Feb 2026 11:41:30 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm476596725e9.10.2026.02.13.11.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:41:29 -0800 (PST)
Date: Fri, 13 Feb 2026 20:41:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
 <aY8wyR572eZYWVJY@sgarzare-redhat>
 <20260213191138.GA2131983@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213191138.GA2131983@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11308-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sgarzare@redhat.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9826D139429
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 at 20:11, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Stefano,
>
> On Fri, Feb 13, 2026 at 03:11:38PM +0100, Stefano Garzarella wrote:
> > On Tue, Feb 10, 2026 at 12:04:47AM -0700, Nathan Chancellor wrote:
> > > Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
> > > Generate debuginfo package manually") on RHEL9, which has an older
> > > version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
> > > issue with specifying %files for a -debuginfo subpackage.
> > >
> > > The first patch restricts the new -debuginfo package generation process
> > > to CONFIG_MODULE_SIG=y and RPM >= 4.20.0 to ensure it is actually
> > > necessary and working. The second patch restores the original -debuginfo
> > > package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
> > > build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
> > > -debuginfo package around for older versions of RPM.
> >
> > Yeah, I had similar issue on Fedora 42 (RPM version 4.20.1) and this series
> > fixed my issue.
>
> Thanks for testing! I find that a little odd though since I tested
> 62089b804895 in Fedora 42 during my investigation of the problem and it
> worked fine without these changes. Nevertheless, I will add your tags to
> this series when I apply it.

mmm, that it's odd indeed.
Without this series applied, I had issues on Fedora 42 (RPM version 
4.20.1), but it worked on Fedora 43 (RPM version 6.0.1).

I just retried on Fedora 42 to build commit cee73b1e840c ("Merge tag 
'riscv-for-linus-7.0-mw1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux") and I have 
the following errors:

RPM build errors:
    Dependency tokens must begin with alpha-numeric, '_' or '/': #�) = 0x0d000002
    Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x47161b0700
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x339b1a000ac0
    Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x36000000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7508200000000000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e76000000000400
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x803ab2b00000000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1a00000000005e00
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x125590000000060
    Dependency tokens must begin with alpha-numeric, '_' or '/': = 0x03080000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x818000000003600
    Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': $) = 0x1c01040000004d00
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x63c300000000000
    Illegal char '?' (0xffffffd8) in: 3�
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1320f691700
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e17101500
    Version required: ksym(g) =
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': p) = 0x3875480000005c
    Dependency tokens must begin with alpha-numeric, '_' or '/': ]) = 0xfc22000000003000
    Dependency tokens must begin with alpha-numeric, '_' or '/': 2) = 0x5d0d03cc22
    Dependency tokens must begin with alpha-numeric, '_' or '/': ]) = 0x32042c1c
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1c11a3d1b00
    Version required: ksym(�) =
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3220312e322e3400
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x322e353120295400
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x2029554e47282000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Illegal char ')' (0x29) in: (GNU)
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': #) = 0x031c0000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x570d03ea11
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x4000000520d03c0
    Dependency tokens must begin with alpha-numeric, '_' or '/': C) = 0x690d03cf33
    Dependency tokens must begin with alpha-numeric, '_' or '/': �l) = 0x102000001471140
    Dependency tokens must begin with alpha-numeric, '_' or '/': i) = 0x4a00000000011000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e00000000240000
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x42111503a533
    Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0xea1303bb33000000
    Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000

But if I apply this series on top, everything is fine.

Thanks,
Stefano


