Return-Path: <linux-kbuild+bounces-5083-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CED9ED4CC
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 19:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65164169164
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 18:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEE020A5CF;
	Wed, 11 Dec 2024 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Rekdrgya"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BF209695
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Dec 2024 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733942557; cv=none; b=EnyA//q78Y0y+/S1afpBjEJ154tNu1tybTC3tDgvJaa8WA7Xfsza3JlKq11rwgGbd+jvKhhmWwUsurANNA766HKOCCpGjutfKKFL/+l9Jl0P+KgMson7Sjr9C7qHBJw2FqZCXazkJNQC+x0C4RDVybSF+3Nr94oiwacgF/ya33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733942557; c=relaxed/simple;
	bh=SkpeHUB+DvSm6pjTjc2XWRWHLlFEQA0k5ibgRjASxjQ=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=g1/XlCgkVgL97ePy3C3EZUgSau5X24WsZk1ZHe3de1oowJz2G4XgLrvKgxhPAor5HOBJRpYvvCeMVFnkuXXEJKpc7AkzaKTht952bAQ20DsXw0gAm+YlVOKrLd1kRsAWAnJm4It3ABq/CakNpmv1Bn0oQaD1Z357+ZECgJIX8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Rekdrgya; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d884e8341bso51913326d6.0
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Dec 2024 10:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1733942555; x=1734547355; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04pC3QGQRTjTk+8Lsd4Sud0CdSb7C3narM3VOyiHdY4=;
        b=RekdrgyaJyAhHM2C/jJkK760uWHAUafwyHjhBW86aOYefF7u937EIyHZigFdl86tO6
         eB/ZBeoTkzDCtEDUXEcf/SZdjFz8PZnCQgdDBCPeXz4YIm6FGzb60wIhuTkVrCrh6+Ob
         epI52hb02Sr0JlET0PYmj73cyO88PdM9dVUjdRRl+Ly6mamnoen5ytGFbUCTCai8GlYT
         8r/A5JFbvae+BER88/b7qb9sZMia/8l+L9pPAwle2NXCRJUbRCo57DAsz06GKYjfaEja
         2wFGNTarHdI3nJy8jdahVv0t+lj1+Vjjz9P+ja8VehqxcmHyKn+NKa8augRZ7dAQOx7D
         6E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733942555; x=1734547355;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=04pC3QGQRTjTk+8Lsd4Sud0CdSb7C3narM3VOyiHdY4=;
        b=sXZVAdlaAj/uisUn1f9cmdaVO0H6pJrn7FRswl6686bio5tQFRenn5dbgjp2ua0v7x
         gtl2kxpCj1r4e4BiL752DP2VfuyG3kodCIPeaoSyqVFHpAEQiM0No2j6PTSWomqmWsOX
         zrKUhQlh4AfHloB24IiG4LDURgr/yj/GjYjP9N/uvWudLP77z6LMOIFXrv/WYRHy4hSt
         TwiD82GRk7kWhutjQdgZImpd/2IWo5gwTdJK9CIGIbt7HxQ0EJxvT5Ua7I3/AK0fFZ2y
         6fof4K7dWwajsW4TZUF3J8SVEes3JMkDv//dQpwo76RpqYEYqzYpyqIDVrGNGY+0M8oB
         sGFw==
X-Forwarded-Encrypted: i=1; AJvYcCW+EJy0DRuEEcqJ59lB6bC5YGSUjCuB5VOZuULHPlMr6ap2Ey65qqNu6ZM+Q/KJC/D0eDilHsOqNlsg0Pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2zGojJ6pwmz+Q6utTSq/gKGuuZaXxZfG6/kYGdzJlUvP9coP
	vD+zs99qhEbXPpjYWnp8REYtlDsCZtaTseBT3dednEVgJ4LKUipDc+BojNsLXw==
X-Gm-Gg: ASbGncv8IDUDT9JFPuS7N3oaF0wVHXqLH+uVI14f3eWEPbLxQ6pktf61A98PPs2QKkV
	fe8hwRD0PgcuXZF2w8KAQwUeXuEl6e3jkQxZeiDsqkNBdf2KOjpyPEWfDMogbbxOEawEirDvvLu
	H1lS9MyBZFn/Zkh28NyocrMTIW3iz/lHK7jtAW49vdJ5R55/bkNgKkabjxL2f7I6+WSNTChmDcq
	JM2Z9JsNXJ4y59GcODusjJJgD5pzQ42C3oRjXTuhxbdyfxI
X-Google-Smtp-Source: AGHT+IF8JGBQo7vcnwREb0hv0tLiDlDa3CzKzT+euqnc01x3sznCCGYD4tzOwAdA7vudAvAWm/Vg9A==
X-Received: by 2002:a05:6214:1d26:b0:6d8:99b2:63c5 with SMTP id 6a1803df08f44-6dae38edf96mr5007076d6.12.1733942554726;
        Wed, 11 Dec 2024 10:42:34 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da66db6fsm72504186d6.10.2024.12.11.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 10:42:34 -0800 (PST)
Date: Wed, 11 Dec 2024 13:42:33 -0500
Message-ID: <e9fa92d65ef886d1f5ac8daf1bbc3939@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20241211_1304/pstg-lib:20241211_1304/pstg-pwork:20241211_1304
From: Paul Moore <paul@paul-moore.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v2] selinux: add generated av_permissions.h to targets
References: <20241127-selinux-clean-v2-1-a6e528c1ff93@linutronix.de>
In-Reply-To: <20241127-selinux-clean-v2-1-a6e528c1ff93@linutronix.de>

On Nov 27, 2024 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de> wrote:
> 
> av_permissions.h was not declared as a target and therefore not cleaned
> up automatically by kbuild.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Link: https://lore.kernel.org/lkml/CAK7LNATUnCPt03BRFSKh1EH=+Sy0Q48wE4ER0BZdJqOb_44L8w@mail.gmail.com/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> Changes in v2:
> - Adopt Masahiro's suggestion
> - Link to v1: https://lore.kernel.org/r/20241120-selinux-clean-v1-1-68704e007f7a@linutronix.de
> ---
> I left out the modifications to the grouped target comments.
> The current state doesn't hurt and I was not able to come up with
> something actually nice.
> ---
>  security/selinux/Makefile | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Looks good to me, merging into selinux/dev.  Thanks everyone!

--
paul-moore.com

