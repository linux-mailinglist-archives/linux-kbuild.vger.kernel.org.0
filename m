Return-Path: <linux-kbuild+bounces-1081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C886B51A
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Feb 2024 17:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F0F41F2151D
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Feb 2024 16:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26496EF10;
	Wed, 28 Feb 2024 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdvPelSE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0616EF02
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2024 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709138192; cv=none; b=JcMLP1d+oxpX7BlqT6Iy8GbPu6qaXo0S/uCNdzDBWiEr74Fmou/S3br4jx1ZHExduhF89CLLDSIfvqfYYXiFc5lnxgl60rZfZ6tzws1U5TAOwEtkX34tDhntfCrdQ3kXcRaP36kUggx8TQBuZdr++QrQfJuejQ7EkK/l6XHwZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709138192; c=relaxed/simple;
	bh=lX/E+oFzHZgf8WFICQMdspnnLOa8jTGF55UF2CpLhIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RIsxmUDpEdTvm9ms/M7UEf35SOKpdCFUEKXcJYkIwj+waaw0MJRA1toe1uEbP61qQP95dsADdiZxajRqwGrMrqOgLPVZwVxlt3DTQjZ0N3bGEpkFBn3kAMuSptvt3Ew0RmewXx0gsYL7B7Jh55ZGm1m6bz/Rbl4CZ9EWlq5065U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdvPelSE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512aafb3ca8so5675363e87.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2024 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709138189; x=1709742989; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoQAUkuCbjxPqHuY8suWnZhA+LDTq6S5txN9J102G3M=;
        b=fdvPelSEnFuF/Mu+xjt1/i7K6A1I3mia5mbn5CwS51UDs/OeKUhKk6D8As1OGfB2F3
         Wn99niKgSLKmqnzYGOxDVXi6DbE5uBtcngZzeIr1WEiXKLyVg653aUIKaJiroglM1R/e
         Qc5iNMkha9tdipV59u+JXZfJ4M0UcMTsmdnvuADjTYed4mKqe3ngDWb53OY7LlEUjT3m
         uy/FxBXRpJTCwKFlKkmq3pbnspy1AU7jLZeCUWsvLBikhZGDW5Z/hxbguNP27oKbiwla
         J+rQXNCyW37dXWlp3Bu6eg3OeYWhRvT76iGRzaWM9MQjy4lAOnr0lj6tklaORGz+8R0z
         8zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709138189; x=1709742989;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yoQAUkuCbjxPqHuY8suWnZhA+LDTq6S5txN9J102G3M=;
        b=iv9qIDbSH3PMzd94IEs3R16vobrm99Pa+N/219hGiAIcBTU/y/SIkDghoSMRBCt7Rf
         z86P/wfaV8HjvJ7FDfXQDDXqk0T3JPVeEduKpV3acjYpAVaVNAa2kUjjfTc1CQOgfcUR
         QMDVe5Jh0KWgkzgBnt6TzKKwfdzUTZtqkiDycBOMNBmPd6/hVBrl1IdFtssHWRdhyput
         6vIfIY/HdEhaNvYZCthH9fyrjMiDiVUijylrJ+Z+AmIbKWIBACYB6qsoynBA/bjoMUma
         U1lm2g7WrFnkpKYnVE3K5C0vQCCfVDYteyby5Fq2QGWv8Dxm9v3QhodrFDMJZ0hhcAz7
         X17w==
X-Gm-Message-State: AOJu0YyQYvRCDNiO3u0L0+x1PaCqnJZFHE3K2+gQWnXktybHg2qbqFHI
	s4gjuXH1wYrR2wW1ISMUyFH+zxgxZW3fp1a1XVKbNNdW1fexllpU
X-Google-Smtp-Source: AGHT+IE6L6HlAkI6x5FAXATcPeZTu3CRa1IGHdmIfAJN6HYjAuJXIMw3UBqseQezjnbPBjsnq7e7NQ==
X-Received: by 2002:a05:6512:e96:b0:512:d554:f1df with SMTP id bi22-20020a0565120e9600b00512d554f1dfmr125645lfb.65.1709138188835;
        Wed, 28 Feb 2024 08:36:28 -0800 (PST)
Received: from localhost ([109.195.90.61])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b00513140c53b7sm486179lfk.24.2024.02.28.08.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:36:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Feb 2024 19:36:27 +0300
Message-Id: <CZGUX81CR7UB.EUM2N93UUY2H@gmail.com>
Cc: <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] kconfig: menuconfig: Make hidden options show with
 different color
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Tomasz Figa" <tfiga@chromium.org>
X-Mailer: aerc 0.17.0
References: <20240228060006.13274-1-tfiga@chromium.org>
In-Reply-To: <20240228060006.13274-1-tfiga@chromium.org>

On Wed Feb 28, 2024 at 9:00 AM MSK, Tomasz Figa wrote:
> When hidden options are toggled on (using 'z'), the number of options
> on the screen can be overwhelming and may make it hard to distinguish
> between available and hidden ones. Make them easier to distinguish by
> displaying the hidden one with a different color (COLOR_YELLOW for color
> themes and A_DIM for mono).
>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  scripts/kconfig/lxdialog/dialog.h  |  5 +++++
>  scripts/kconfig/lxdialog/menubox.c | 12 ++++++++----
>  scripts/kconfig/lxdialog/util.c    | 19 +++++++++++++++++++
>  scripts/kconfig/mconf.c            | 18 ++++++++++++++++++
>  4 files changed, 50 insertions(+), 4 deletions(-)
>
> Changes from v1:
> (https://patchwork.kernel.org/project/linux-kbuild/patch/20231228054630.3=
595093-1-tfiga@chromium.org/)
>  * Replaced A_DIM for color themes with COLOR_YELLOW, because the former
>    has no effect to black text on some commonly used terminals, e.g.
>    gnome-terminal, foot. Reported by Masahiro Yamada and Nicolas Schier.
>    I ended up with COLOR_YELLOW, as it seems to look comparatively dim
>    with mutliple light and dark color themes in Chromium hterm and
>    gnome-terminal.

Thanks! Run a quick tests in xterm. Looks neat!

Is there a reason to set hidden flag in all of the _if_ and _switch_ statem=
ents
in the build_conf() function?  Could similar be done in a more generic way?=
 For
example:

	visible =3D menu_is_visible(menu);
	if (!visible)
		item_set_hidden(TRUE);

Or this approach will bring some negative side effects ?

