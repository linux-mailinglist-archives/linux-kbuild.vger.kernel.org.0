Return-Path: <linux-kbuild+bounces-13784-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o77tMxIhMmpYvQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13784-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 06:22:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21594696663
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 06:22:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O4G3SEB3;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13784-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13784-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D908308A5DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 04:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC61C3009E1;
	Wed, 17 Jun 2026 04:22:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4C19DF55;
	Wed, 17 Jun 2026 04:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670122; cv=none; b=qDlRMgJ7dDUwgfYOis1aT1NN5KlHLTo53XB/I8GpVDTmAqRC1l/CZd8vpJTjZ/Uv+NSm5Ptn1ET9/KzHoze5DMXwPx0XJGd8CdFvTJ/M+mMJlp5BzCpXLRt6silMjpKY88j9B72yrO5ttAr4dJV2H+tHJamFY3w+6YvJlgBGHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670122; c=relaxed/simple;
	bh=35DEzLO5ORXnNrvPEy+FOgRJHSFAGlodR7f8F449hsU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qVoPcvlPEArbft8vI2h9iIvqAmcFssgQJyGP+bAurBVcTevEkI0KNxbHlDbYVOVZJmQxh+INyB+qimvz5j/0e+r4IL5J+c2w8JHwVQ/GkLXGf1K8bgI29f0X0+qGIJY2Z68GzE0AHG5NRN94oPUyu5g/rRkE5/b0T0ttSsxaBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4G3SEB3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E28B1F000E9;
	Wed, 17 Jun 2026 04:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781670121;
	bh=fUF3YzkrYB+RRcfsJuk2wfkqiVjO5X03v+8FeRfbDKw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=O4G3SEB3lpIALqka75onflTJ39hWm6DM1PxEl+NruzoPMhKHrXjn9tIBE2lZ26qI7
	 x8BIvJT+F/hJJtmqieTB0M/ljPTmcqtuavl+4H/LztyC28MuAMwBDi24f/EXJjj18L
	 m2o4kzJVxAwLR2rGUpTCd4NVuzf2oILPkww984q/NAPPn+sG2ADxtsyHpPowugK39Z
	 Su89Qesof9i8z84iAW65immWL/BxyDc92IIDpEQN2CGwtsJM/47dNPHKRDjtBOavu0
	 yWFWM6QPQwD/KZwtQVivVMPbSrbLkZzy/lVIQJAq0MHCGiHixmJL+CROh+CHypnjg5
	 1uDVafkOXi9dw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] modpost: release allocation when early return no
 suffix .o in read_symbols()
From: Nathan Chancellor <nathan@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260610052550.187006-1-robertusdchris@gmail.com>
References: <20260610052550.187006-1-robertusdchris@gmail.com>
Date: Tue, 16 Jun 2026 21:21:52 -0700
Message-Id: <178167011232.2064238.5669414796099955471.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=nathan@kernel.org;
 h=from:subject:message-id; bh=35DEzLO5ORXnNrvPEy+FOgRJHSFAGlodR7f8F449hsU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlGCs8Ll1ze2eO5g2nyzBAjYe97Djm7Fp9JidhrbtZ82
 ujf12lXOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBECj8zMvReM10urMu/e7kk
 U76tYZn3TK/l61XeB4Txq9q+mbZhihzDH+4LogKa+yL8n7OfEBOb9M503g7NGteZKzfyqFyukBX
 8xQQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robertusdchris@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kernel-mentees@lists.linuxfoundation.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13784-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21594696663

On Wed, 10 Jun 2026 12:25:50 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..8e231544f9f3 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
>  
>  	if (!strends(modname, ".o")) {
>  		error("%s: filename must be suffixed with .o\n", modname);
> +		parse_elf_finish(&info);
>  		return;
>  	}
>  

Thanks for the patch! While this change appears to be correct, would
moving the strends() if block before the parse_elf() one resolve this as
well? I think I would prefer going that route because neither check
really depends on the other and we have to think less about unwinding
with the checks flipped. Furthermore, modpost is a relatively short
running host utility, so I don't really think it is worth optimizing for
resource leaks like this.

-- 
Cheers,
Nathan


