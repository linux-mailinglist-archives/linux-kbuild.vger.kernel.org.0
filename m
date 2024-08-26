Return-Path: <linux-kbuild+bounces-3227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A911295FB71
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 23:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7E61C20E02
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 21:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07BA19ADB0;
	Mon, 26 Aug 2024 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FenU7q1Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8CB19AD81
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706885; cv=none; b=IPC1+pI0r9dsbFrD/3Llyjr7SLwefiNkU2PFOe+k3er99XMHoZQllGU4Pq4tV8ktI9Y7sEJhJryn+wJx147BI5VM4QwJoA5HYQXMLDr0aaQ85QTh6oRRRmhFMQhguhxB1JgO1kD+DaeDBzoDzx44CzYTpZApuE6MCVlfMvtdiy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706885; c=relaxed/simple;
	bh=yBQ5y+Mb/CKBn/Iu+oeyfy0yTYtT35Q0Pi8FqyJi4Ds=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=C7vNFTS6EqdwUZvaMaTEIa45+fw3TO2CG2PUUJPYsEeznJZ/gIfoyCppQPDq3NL4UVpfE66e6EmFxYebGMRu46bhZwq7nM66XMQNy71gbE8ZfR0UTeH4aQC2k7PzmQgQCfMfVMyyGvYCa7wjZy5X5J6JazoUnA46UHQQTHu+bxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FenU7q1Y; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e13c23dbabdso4577869276.3
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1724706882; x=1725311682; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OfqvTXWrFldpunr+TQo/yeqa5OS+oEjv/nJw1AhDV/M=;
        b=FenU7q1Yw8t+4WiKBZThmfET6KwI2suyOv6R/XgPPEVyJ+nI/oj10zNY7xEzs6EUeI
         bT84tQy/ErWs5VFjmbYc2GMACE7aFy5OjpoBn2PcclkE3gRGoRu9C1qTGGmkcu+UpxyM
         cJZBMAuxH+OTbcKZk3Ind0+fw8+DmvMr5FhBbP43tx6JWPLUS8gtyWh6tyCEnnIYkj17
         3MZ4a6dsyYdCRQF1P8BsCI4zKJm4m9aldAz/p2Dd/gYclfDfKyOj00skTZVP7Xa6CmCb
         SCSBTp8xZgm7kk4uMKyO47TfPwGJgDS3DLBGdS39W/gW3tgq+5l2m2UsrYgh+7p0d78W
         rqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724706882; x=1725311682;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfqvTXWrFldpunr+TQo/yeqa5OS+oEjv/nJw1AhDV/M=;
        b=qIQ8WoDQEUbzrSCLhNwD8p2aIPjYmOKQ53q1Sw74JseXPuOmvt6wcFfZalSTI2YOTK
         iONpYPFIUwPWvtrkQQb20r0J74GZitgYofrNbE/vipqvJWA/N2t9yb2sVC4Ezz0PsBV2
         Yt4zql656dTXUobOlP1Mn/VA6IWcCbd6qO/CUTv3F8TE+ZUe1AFaiZafGik/1Lo7N+9q
         u9MNrCMPpfoq4YcM7eBzVqXTN6JuXxzA/gdw9OVatW1+lmxvUPeVj3U5PU52cfXeorAC
         rCvddfVxt5+eTUGUJ6ZaPN9LlZ67uBpQFjoSLR71X4ihk+15Y9ye896rrGFAmxP96aVS
         mMgQ==
X-Gm-Message-State: AOJu0YzDK2+rTrGS3EdIV03bE+5seDqUxIkQTjK/9vyaPwJiEBJWwKvA
	9f7Gk6+i91RXO33fUq6VljTAdg3g5XREyuizIzATxxAxeMF8yc69ubzh/6jf/rIGL0YsIbdIi8Q
	=
X-Google-Smtp-Source: AGHT+IEbYWdr5Hnl4ZVk1T1sAYpHTMGnsK6xf7bfqR4BRfFMeNhZqzWNrEjRK6NPwcMTOvklx7UWzw==
X-Received: by 2002:a05:6902:144e:b0:e11:7a26:29a with SMTP id 3f1490d57ef6-e17a8add737mr13085054276.1.1724706882186;
        Mon, 26 Aug 2024 14:14:42 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162dcd3a4sm49877986d6.113.2024.08.26.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:14:41 -0700 (PDT)
Date: Mon, 26 Aug 2024 17:14:41 -0400
Message-ID: <3447459d08dd7ebb58972129cddf1c44@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-security-module@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, selinux@vger.kernel.org
Subject: Re: [PATCH 2/2] selinux: move genheaders to security/selinux/
References: <20240809122007.1220219-3-masahiroy@kernel.org>
In-Reply-To: <20240809122007.1220219-3-masahiroy@kernel.org>

On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> 
> This tool is only used in security/selinux/Makefile.
> 
> There is no reason to keep it under scripts/.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/remove-stale-files                                 | 3 +++
>  scripts/selinux/Makefile                                   | 2 +-
>  scripts/selinux/genheaders/.gitignore                      | 2 --
>  scripts/selinux/genheaders/Makefile                        | 3 ---
>  security/selinux/.gitignore                                | 1 +
>  security/selinux/Makefile                                  | 7 +++++--
>  .../selinux/genheaders => security/selinux}/genheaders.c   | 0
>  7 files changed, 10 insertions(+), 8 deletions(-)
>  delete mode 100644 scripts/selinux/genheaders/.gitignore
>  delete mode 100644 scripts/selinux/genheaders/Makefile
>  rename {scripts/selinux/genheaders => security/selinux}/genheaders.c (100%)

As long as there is no harm in keeping genheaders under scripts/selinux,
and based on your cover letter it would appear that there is no problem
with the current location, I would prefer to keep it where it currently
lives.

--
paul-moore.com

