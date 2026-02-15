Return-Path: <linux-kbuild+bounces-11318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TSzcMqQ6kmnUsAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11318-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Feb 2026 22:29:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7013FC24
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Feb 2026 22:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C201F300957A
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Feb 2026 21:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62AE273D75;
	Sun, 15 Feb 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiraeQSU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD796199E94;
	Sun, 15 Feb 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771190945; cv=none; b=Nkq/tscprWeTOQRfo4JYfY22ATCM+8mK2A2VfvaAQUk0F2cWQB09ZxXZrLOalyMnfH55JgSSGybWPktoAR+e3q85HLDnaQVf1bj/9Cp+nN89LiEqg7PWweoW6tomXRgfqzfGgwBA75RBDupmvyzN9mswVKqF/oKFH58kExCC56Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771190945; c=relaxed/simple;
	bh=nhkYLIHqPzVUQP5I+FqQq6d2TGUdr1qSSnQAKviJDBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irvgNnu/iygYxutJUZSXxo6/kyH32S7PxtFm0vvlVppcXLx10Tce/dUyVAn+25ez1FrlYEHEb2MEa2brfb/vMkktClLw9arVrccvQ6EhG7KruIk2daqItQMRxalbd4H19lMGxFXswQYaTi18/8qHekfpwOhyifBeDlo9nHEDFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiraeQSU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A07C4CEF7;
	Sun, 15 Feb 2026 21:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771190945;
	bh=nhkYLIHqPzVUQP5I+FqQq6d2TGUdr1qSSnQAKviJDBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiraeQSU79utJMzPGQlp3tbHg2H+kOlRsEOQVqjB6vXrp0beJdvC7Yuyp1R07RMgJ
	 rIBHVL4qEXrX6PfpyAPvnAICFwh0QuC8nm5LgPr/HPNLbjHSMOCKd7UNyW7AzTdi56
	 6z/k4Z3zG42iqY71WwqXoA/8IFKSM0ZfBj57VtZ40IA9rti/bQ+r6J2STfB2YDWq8l
	 D5h0m3ioMcVeqhriUX/ZMzNJuVH4r6zdckXlqulEnMk6NgSqarwK9UZ7ep6o2pto7o
	 5OxtwPF1ETfftIyuzWH1bi8GZdaMr84+ecn5nokXfj5JuUdimZyT2lbkWj63szYaL+
	 rtUvosdLvL3MA==
Date: Sun, 15 Feb 2026 16:29:01 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <20260215212901.GA695045@ax162>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
 <aY8wyR572eZYWVJY@sgarzare-redhat>
 <20260213191138.GA2131983@ax162>
 <CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11318-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DB7013FC24
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 08:41:24PM +0100, Stefano Garzarella wrote:
> mmm, that it's odd indeed.
> Without this series applied, I had issues on Fedora 42 (RPM version 
> 4.20.1), but it worked on Fedora 43 (RPM version 6.0.1).
> 
> I just retried on Fedora 42 to build commit cee73b1e840c ("Merge tag 
> 'riscv-for-linus-7.0-mw1' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux") and I have 
> the following errors:
> 
> RPM build errors:
>     Dependency tokens must begin with alpha-numeric, '_' or '/': #�) = 0x0d000002
>     Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x47161b0700
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x339b1a000ac0
>     Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x36000000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7508200000000000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e76000000000400
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x803ab2b00000000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1a00000000005e00
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x125590000000060
>     Dependency tokens must begin with alpha-numeric, '_' or '/': = 0x03080000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x818000000003600
>     Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': $) = 0x1c01040000004d00
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x63c300000000000
>     Illegal char '?' (0xffffffd8) in: 3�
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1320f691700
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e17101500
>     Version required: ksym(g) =
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': p) = 0x3875480000005c
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ]) = 0xfc22000000003000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': 2) = 0x5d0d03cc22
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ]) = 0x32042c1c
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x1c11a3d1b00
>     Version required: ksym(�) =
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3220312e322e3400
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x322e353120295400
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x2029554e47282000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Illegal char ')' (0x29) in: (GNU)
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': #) = 0x031c0000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x570d03ea11
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x4000000520d03c0
>     Dependency tokens must begin with alpha-numeric, '_' or '/': C) = 0x690d03cf33
>     Dependency tokens must begin with alpha-numeric, '_' or '/': �l) = 0x102000001471140
>     Dependency tokens must begin with alpha-numeric, '_' or '/': i) = 0x4a00000000011000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x2e00000000240000
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x42111503a533
>     Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0xea1303bb33000000
>     Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
> 
> But if I apply this series on top, everything is fine.

Okay interesting! I have not seen that error yet... I wonder if adding
'AutoReqProv: no' to the kernel-debuginfo subpackage (like the
kernel-devel subpackage) would avoid that for rpm 4.20.0... Probably not
that big of a deal if it is resolved with rpm 6.0.1 but it would be good
to avoid as many corner cases as possible.

Cheers,
Nathan

