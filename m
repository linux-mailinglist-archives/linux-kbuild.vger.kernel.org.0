Return-Path: <linux-kbuild+bounces-12938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ40EbOD8mnLsAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12938-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:18:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130C49ADD3
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6948302EE85
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 22:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1C4436347;
	Wed, 29 Apr 2026 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmatvMju"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62AD33A6E2;
	Wed, 29 Apr 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777501001; cv=none; b=DxNDjHoBTkPifEKcwWjUP4/yq+veu0pcrL5m5Ra7I7JJlQrUlbTbcI/RTVm3EE3yWbTmqeUZ76N8v5QFmRsy5Rt4IFUPWoGVFdUbHhhfl8snyOXtNe31Cm7oSxXkmtGLYkuJHAQUmD+lPM1ApxYaLIwZGQOb43TjHLuVzFObzpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777501001; c=relaxed/simple;
	bh=kYrJjuY9MziX8QSzOBFJa80mJGzs4dcmf3o1fMkmN0w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=MHAp4xnD1W0LHIaO6X8pzYoo17MOP8mULqWaV1akZJjitL54gTBjgQoMXlWAEMIWIMmNFbKa8ZHCG1ZqrafXjdCxKwk2CzjEsUMd2I77S7tYyENgkGQ1dIARhaOKBalAvOCt0vbvrTFASRs40qVpqmWmpCfqosX5J4AU8XAt5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmatvMju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F614C2BCC6;
	Wed, 29 Apr 2026 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777500999;
	bh=kYrJjuY9MziX8QSzOBFJa80mJGzs4dcmf3o1fMkmN0w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=CmatvMjuaJVDvsMkFS6f+j9ZnnZWO9OeL5MeBSKEwAwtrKXQnd4rTv9dwEB4Nfepj
	 Ido0MNkdXlxVJYuj1UkYcrnJuzOgqIebOVi0q14uL2J5VUmM8uNJW6CPvaLVLMaAiL
	 i3v+pwbJPlxHQtAS1oE4pDM0JBnqhSEyP40+1wxJutQa2V4ddGx1Kc8uBy7fsWZ3fQ
	 Jo7iVTG4xN2KCy1AkD5RCGRPsZ71A1UBHWMpoqsaRjftd83wW37c84zgU46R7aswqA
	 +BqbCSHwn7ra6P3iWYHzLWX4LADNnCS/Jw/8nYVbdMGffyoIw+InxGTYr3AfBuaRid
	 bY+B6bkywT39w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: document generation of offset header files
From: Nathan Chancellor <nathan@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Rutland <mark.rutland@arm.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260410221257.191517-1-piyushpatle228@gmail.com>
References: <20260410221257.191517-1-piyushpatle228@gmail.com>
Date: Wed, 29 Apr 2026 15:16:29 -0700
Message-Id: <177750098929.4159127.15212572621260743691.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kYrJjuY9MziX8QSzOBFJa80mJGzs4dcmf3o1fMkmN0w=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfml1SpZet/q6xr65ql6vtk11us14wXpulkB6ck/56C
 SfDr/9MHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiGwoYGWbXVfW9ePZzauOT
 HKtAYYZr+457Lkp0zHoYt+TKYYXF/KUM/+sdyk6GVG/fEBG5y5PrWsP2w2cSRGbcXFs3xeNkZIy
 AFAcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 9130C49ADD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12938-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ruhr-uni-bochum.de:email,ravnborg.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email,sashiko.dev:url]

On Sat, 11 Apr 2026 03:42:54 +0530, Piyush Patle <piyushpatle228@gmail.com> wrote:

Hi Piyush,

> Replace the placeholder reference with a description of how Kbuild
> generates offset header files such as include/generated/asm-offsets.h.
> 
> Remove the corresponding TODO entry now that this is documented.
> 
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>

Thanks, this seems generally good to me. I had wondered if it was worth
adding a "lay person's explanation" of the example but I think it is
fairly easy to understand.

>
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 24a4708d26e8..7521cae7d56f 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1690,9 +1721,3 @@ Credits
>  - Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
>  - Updates by Sam Ravnborg <sam@ravnborg.org>
>  - Language QA by Jan Engelhardt <jengelh@gmx.de>
> -
> -TODO
> -====
> -
> -- Generating offset header files.
> -- Add more variables to chapters 7 or 9?

Sashiko notes that you also removed the TODO around variables:

  https://sashiko.dev/#/message/20260410221257.191517-1-piyushpatle228@gmail.com

I don't think it is a big enough deal to warrant a respin but just
something to be aware of for the future.

-- 
Cheers,
Nathan


