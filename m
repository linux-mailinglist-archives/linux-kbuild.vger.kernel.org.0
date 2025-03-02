Return-Path: <linux-kbuild+bounces-5938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49197A4B378
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 17:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687EC16CBB1
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 16:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CB51E9B23;
	Sun,  2 Mar 2025 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2ObCLGA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1209B1E9B1D
	for <linux-kbuild@vger.kernel.org>; Sun,  2 Mar 2025 16:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740933596; cv=none; b=u+reM+R6dm3eznvHFpEwiblGq6PuOygYlTFzLsp0Ee/0i2Y644sU1QuJ8lzsDhILlM/zHf4unsKedds3mhzbJYWsdiopDM5vHsAqa8JYvD2wrBDdfHNZhQj7+VSEwMroiB6fXlqeo3hCjiWQn4vBE4e9hJKLnzQOVz/+8n+80Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740933596; c=relaxed/simple;
	bh=vAx2JxPXWi0YAfLQcTF8Efz3e+cW0CsLUfPr5gPk0LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAOJwuFmJ/cwJXDDRp8IbzRt/XRi7OQmvMsLxp+O0aUsUPjpEweqGN7v//gFWwrzw6EbVvbl5X7m8aZvFE5JEtxDa/FQh8/2G07GJrtk9WxZX2PSFZsnW9ZP6uero28Sc7BG9KtXmnA+02rVyUMrsv1BHp80u0d+gZijvwavxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2ObCLGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82263C4CEE4
	for <linux-kbuild@vger.kernel.org>; Sun,  2 Mar 2025 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740933595;
	bh=vAx2JxPXWi0YAfLQcTF8Efz3e+cW0CsLUfPr5gPk0LI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A2ObCLGAGiz1TIQb2VKFz/J4Ktc78T3HuH8Xlr6xFbIxvsXqPwxvKcl18yX4VPVb9
	 P7IQpteHvTARYqWNG0W95gkmY3bi0F0j1aOvEBNb2ot/o9xvsz+2l5JkjM3YOwH/za
	 vlgT8ABmNJuZTg4kfbNouniX4WpRsBHmUX4DatFF5bl0FsaP+pKOzPWSTshRtXfS79
	 rjokYJ/YhIGSSqUnZoeYOPSScpKWAVpViV6Uhulk2kNFj4geGDJSAB5b4RtyScJP7F
	 OtS5zMQEckAQ2zjTwvX46AUNDK/MNvng9ADYnqVYgugSUx7tQMarI2B9neJlOu94EG
	 JUghpdCtb0pqw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54298ec925bso5532683e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Mar 2025 08:39:55 -0800 (PST)
X-Gm-Message-State: AOJu0YyWZW64ApyxfIZ4Qxn7eW70yF5T6YCaDQ0X1TGrUKSmqtty1SDR
	CmwI8UlPcryq/Q6XylsCRGeoYKcW2PMlAl6f80vlNgkKYQ1J04n3LSh3mGN/KydhYJKgzU+Ulj1
	gJWFJtaF4irFRX2uT0UKMLtbyGeM=
X-Google-Smtp-Source: AGHT+IGD5HVRFGyQRj+M50xs3E8X9Co53ueM/INnhSNYa86bcZTbTDlMKk41uFl42+S18oFn8Z1S3fUsvmXxEKMC+vg=
X-Received: by 2002:a05:6512:2398:b0:547:6733:b5a3 with SMTP id
 2adb3069b0e04-5494c31955emr4278189e87.28.1740933594176; Sun, 02 Mar 2025
 08:39:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228113706.154519-3-satoru.takeuchi@gmail.com>
In-Reply-To: <20250228113706.154519-3-satoru.takeuchi@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 01:39:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT1ZssOG3RLjLQEZ1veKSDYz+=9YhjHPYM=9P7883ZASQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpKkkgq0f7bL5k1MdvnxEhjqw4KN5-dxFBWN7yXYpAVFGlE_9BI2ck5r6M
Message-ID: <CAK7LNAT1ZssOG3RLjLQEZ1veKSDYz+=9YhjHPYM=9P7883ZASQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: Kconfig: fix defconfig description
To: Satoru Takeuchi <satoru.takeuchi@gmail.com>
Cc: linux-kbuild@vger.kernel.org, miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 8:37=E2=80=AFPM Satoru Takeuchi
<satoru.takeuchi@gmail.com> wrote:
>
> Commit 2a86f6612164 ("kbuild: use KBUILD_DEFCONFIG as the fallback
> for DEFCONFIG_LIST") removed arch/$ARCH/defconfig; however,
> the document has not been updated to reflect this change yet.
>
> Signed-off-by: Satoru Takeuchi <satoru.takeuchi@gmail.com>
> ---

Applied to linux-kbuild. Thanks.



--
Best Regards
Masahiro Yamada

