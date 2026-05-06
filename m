Return-Path: <linux-kbuild+bounces-13042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1+jiG/Ld+mmGTgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13042-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 08:21:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B254D6896
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 08:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 683DA302DFB6
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 06:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE912FE579;
	Wed,  6 May 2026 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Osasct+i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A671219FC;
	Wed,  6 May 2026 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048493; cv=none; b=gEb00pBBH9e8qiOuCxhczIWUPpbUCYBCOAtIWxAmmBzaDigqzXH9WW0H8qiEeF0MhaBge+Apma9g7iLj3l/Hq3VOVQP+F9YHYwRMLd4kp9/Phhqh2H620aO74u7p5DWFLuLXXUXWRfnkJm1+yoknhtjsJz0x6icFyOsFxiJ9/V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048493; c=relaxed/simple;
	bh=Xs/yI0pSytldTKnrEohsfqL9A5TsFmHPW8Vq16m8ijs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wnz0IdatCW+wjlRledBmg0NTdm6CYc/tUT5GhCk4Caya4uxBa+Hh2Hgm9djI1LiDl7kq5rbWZghhffGjU6WRHZlQwfN+iC8Y6tPpSkSwWYDpPuVhaxRSHlduXz3+vFVCyeJK0CVGL1AtKGsjyulRWevasqto9uSslrziVyioSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Osasct+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35ABC2BCB8;
	Wed,  6 May 2026 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778048492;
	bh=Xs/yI0pSytldTKnrEohsfqL9A5TsFmHPW8Vq16m8ijs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Osasct+iooooZeYc4RDvnTRPBva+qyWo2U8LdstYr3cPlmpySczSlCXp8ItTE/e/T
	 eGIeS4h50xiz2asWImamwRdSh9nTcmSkvm1dD9ckafdXIPtIntCLRLeSQPIVqSVZjj
	 g1VgOCmJyNAr00f4HM2n5yf1Nm9sTFE9JqJDTsogzF6TA9Tf6ibB3I1vSBEL958HZw
	 mJ8Mp/+SKHAQzSRWXRqkM9g9y1EXcmBBBMUrgXIlETnu5J2HaeZYrTPVDDzRcfRQ5w
	 uLNKJSBolXJ8mwJBQ+zOPiEEHsyu4scgo+8z3p3S+y4BLlG+d0zCHdCDU17e3duLqe
	 XbS0n+W7tIRKw==
Date: Wed, 6 May 2026 14:21:28 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
Message-ID: <20260506062128.GA322298@ax162>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger>
 <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
X-Rspamd-Queue-Id: D9B254D6896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13042-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[google.com,gmail.com,vger.kernel.org,lists.linux.dev,lwn.net,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Daniel,

On Tue, May 05, 2026 at 03:26:40PM -0300, Daniel Pereira wrote:
> On Tue, May 5, 2026 at 1:11 PM Nicolas Schier <nsc@kernel.org> wrote:
> >
> >> FTR: The translations
> >>Documentation/translations/{it\_IT,pt\_BR}/process/changes.rst become now
> >>even more outdated.
> >
> >>Acked-by: Nicolas Schier <nsc@kernel.org>
> >
> 
> Hi Nicolas,
> 
> Just confirming that I will make the necessary corrections to the
> changes.rst Portuguese translation (pt\_BR) in the next few days.

Thanks but I think I can just update the version number in this patch
when I send v2, as the update should happen atomically. If you patch it
separately, it might not be true depending on when my change is merged.

-- 
Cheers,
Nathan

