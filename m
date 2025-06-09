Return-Path: <linux-kbuild+bounces-7404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D9AD164C
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 02:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0829C188AFB7
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 00:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C62F37;
	Mon,  9 Jun 2025 00:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp2qfJcs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4101362;
	Mon,  9 Jun 2025 00:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429431; cv=none; b=klcx0xNhzlKi/3HufC7jQLTOmVo1Fo+Gyks/sRqczN3T5rK3MZOW940kpZOYnBnWbZ64C/ZSUTW+qvOeYy7LdVthUO6risC28GeiDWIy4nPu3QwUl3IJ0w/eevp+C7uvUxpHGZTQo4doDhYKjf1GyoLm+FFxr2YRC/ZlVEmdFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429431; c=relaxed/simple;
	bh=8r/HNm1RfbBUFPcHvzmhj/4Jnskygu46VHjqqp+Cgbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JH7t90bvo7u7eJ8EcVqOsGQkAsX4hawnCiea36WarEEO0j77d87Upt1Dr4jUtd/QyCMfY8ky5Du3OFbGNfDeVbXtomWFF+GSQAD4HFKvAcNOlLNiI4T3o2LMYZL198b1Uo2vwOTLSQwAOIhTmG7LheNMBYI2yI2eo2XnrDYWWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp2qfJcs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999FAC4CEF4;
	Mon,  9 Jun 2025 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749429430;
	bh=8r/HNm1RfbBUFPcHvzmhj/4Jnskygu46VHjqqp+Cgbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kp2qfJcsVN3UOcZDSnWFqFy45O71a/MR2g4c8EhUhSXuf4IxRM9iQzkYAH48DFofn
	 vleiB08dk6PP0zY2iVUvQ4mOynfllC+JBKLndYnLudn8TX3DSqE3sTX8DMbOFhHUVP
	 DrYbluj3F+4nwYAVEEw+pA8oC02dEr5I8aBBUvqwihg/EMSy1av5Ba8d8qMJc0cSIZ
	 cfeO+TlHQvzNG0Xmj7nfxN4o5BXj1nu10PWo65Ufw66clwhsDC51IZfPAATL6gbqyK
	 2F2cLOdK2C3gUB9jCVN8A7jb5K5JxYl7Sj+tURc6dy0GF7mxnQC63qSfMNpjDF/47f
	 YE5IPWJXETnrw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5534f3722caso4261884e87.0;
        Sun, 08 Jun 2025 17:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFBHZCMvz5BJwFZkICXkkFnu9IS/HDUee9l+o6TORISm91a1Zs5WM/Ru7Yve5cDC4MewZoJwMP9JoB/oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTC68PUfrQr3J45GbmyqwkEH/voPAXlOmvm+i6L7t+9Eo9CZg
	vHP8k8WbNCkxnD7BGIlGModMJsJC+ydcYO92lP7R/+LIGCSBBwInb1YyQ3LPVXdNcSPvPeRLITa
	O2O4dKzjmM0WM1wgqR7nfY43QntiNBLs=
X-Google-Smtp-Source: AGHT+IFPcZnz2iCnNxG4gygy3dtbgjEgouklohEOg6mNjWs2f5g4n8VM2SZTiA/fn08xgqAnpUQLdjsX5VW7+5Eavg4=
X-Received: by 2002:a05:6512:3d27:b0:553:24bf:2287 with SMTP id
 2adb3069b0e04-55366bd09a7mr2704792e87.11.1749429429230; Sun, 08 Jun 2025
 17:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608141235.155206-1-chenhuacai@loongson.cn>
In-Reply-To: <20250608141235.155206-1-chenhuacai@loongson.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 09:36:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzLkVzt7k41vdLCjJb5hET6QRkOE6e6o-onzmyYG6c+w@mail.gmail.com>
X-Gm-Features: AX0GCFtN1Vbzed5M6Umh1IAuoaotE9YmRISqhpfmD4jGfHvUXlYefuZWx2nx2To
Message-ID: <CAK7LNASzLkVzt7k41vdLCjJb5hET6QRkOE6e6o-onzmyYG6c+w@mail.gmail.com>
Subject: Re: [PATCH] init: Fix build warnings about export.h
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	chenhuacai@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:12=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=3D1") and 7d95680d64ac8e836c ("scripts/misc-check=
:
> check unnecessary #include <linux/export.h> when W=3D1"), we get some bui=
ld
> warnings with W=3D1:
>
> init/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export=
.h> is missing
> init/initramfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/e=
xport.h> is missing
>
> So fix these build warnings for the init code.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Thank you for your contribution.

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada

