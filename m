Return-Path: <linux-kbuild+bounces-13381-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sON/KACQF2oUJQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13381-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 02:44:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA45EB5A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 02:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18A71305E653
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 00:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AD93438BD;
	Thu, 28 May 2026 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gkqkxc+P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE715A85A
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 00:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929009; cv=none; b=h9JNeO/kti8CxXS0X3kHnlJW7IvbTl/5z0VM301BNAgM5/TqeNOCUV5KsQoxHlPrlRrvtJYjHTNgr6YjRLUZQztC5+r9kkBXDRNmQQgjkXeuerm7oGP69OsZP6fCRonRglNFDgeoAff9CSJVScHL/+dO41K+PffhSBL7zENPD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929009; c=relaxed/simple;
	bh=I6etxK9HDD8lz/MtFqw2JQ10KJpyOjyHHxEuLo6DwqY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZGJh9ngXGi3mFUoQF/ZLLPJWKtXFlb+poaJvUh2Tp0b47P8YyyfsYV6QckunVQmf/4cALIEtR865Ie72FDJrA3qvJutA+KyA/R5XwIZ1pwX33VyLkh5jvzqURx7LOdI5CUP0NcDXB6pG8oAbgNDqckyPIhXHPfACqxIeIxkPRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gkqkxc+P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9060D1F00A3C;
	Thu, 28 May 2026 00:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779929008;
	bh=TKC4/+1hXoHxwk0D0VHtV6vYSJhNfp87n73VFteEJR8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Gkqkxc+P401nf4WMWS6xxNLyxEPaJXgiVLBRBJ3LTkfe28fw5gJC24Idiip2Am0P0
	 Y2Xvwjfo4FaNoEUBRh70XJwCP88+e1sojsryOUTpSXtdBsWLaeY1ZuClLMxdrrxfCj
	 3WU/OjDG6S5TknxOf8BO6rVmbU2OzhHpo4wPHIV+R+LtEgko/Br4XQG5V0kyVBHHwC
	 +fe5/1fMHsHJB09vHXbro0MMqSK7gsRhWoU2vXu9tBS7fQ+UjJeIvvZjkYzPWEezgZ
	 M8HNiSl2mU8pSZTTt3/626x9NcoOZjaxJleu4beTbXtemdkMpkySUiCXiTxLVvddjG
	 tHdGPBCXXNoOw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
From: Nathan Chancellor <nathan@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260526062732.84006-1-laoar.shao@gmail.com>
References: <20260526062732.84006-1-laoar.shao@gmail.com>
Date: Wed, 27 May 2026 17:43:19 -0700
Message-Id: <177992899911.893622.3247043690183493347.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=nathan@kernel.org;
 h=from:subject:message-id; bh=I6etxK9HDD8lz/MtFqw2JQ10KJpyOjyHHxEuLo6DwqY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFni/etD+nrjGd69mvdzruYRjqkfNLLeb3eqmHP41T7mt
 5XPplukdpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJcPgzMmw5e3zKo1mav2wU
 dVTPG7yt3tbrKK1T5DRHfXly+s7WwH5Ghmt7Ah0KS+Z98pl6VbkuaEIoq12F0pL0RV/Mt2x/N//
 ibD4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13381-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 53BA45EB5A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 14:27:32 +0800, Yafang Shao <laoar.shao@gmail.com> wrote:
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index b3c956205af0..c732415662ef 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -6,7 +6,7 @@
>  Name: kernel
>  Summary: The Linux Kernel
>  Version: %(echo %{KERNELRELEASE} | sed -e 's/-/_/g')
> -Release: %{pkg_release}
> +Release: %{pkg_release}%{?dist}

This seems reasonable at face value, especially since Fedora recommends
this for all of its packages but the value of dist will be included in
the version string with how this is currently written:

  $ make -skj"$(nproc)" ARCH=x86_64 RPMOPTS="--define 'dist .distval123'" mrproper defconfig rpm-pkg
  ...

  $ cat include/generated/utsversion.h
  #define UTS_VERSION "#1.distval123 SMP PREEMPT_DYNAMIC Wed May 27 17:27:34 MST 2026"

Maybe that's fine (or even considered a feature)? Figured it was worth
pointing out in case anyone can think of problems from allowing this.
Another option could be just changing

  KBUILD_BUILD_VERSION=%{release}

to

  KBUILD_BUILD_VERSION=%{pkg_release}

to avoid this.

-- 
Cheers,
Nathan


