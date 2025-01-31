Return-Path: <linux-kbuild+bounces-5593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F345A244E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 22:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F223A4760
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 21:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8C31F3D52;
	Fri, 31 Jan 2025 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLbMAb9s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F57081F;
	Fri, 31 Jan 2025 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359701; cv=none; b=kc641ODhoiWJT0GVvU7ppBGf3IKrpWAfV1qQ5IvRSJxfQ/JzyIUE9DXaPhOHE5fO0a3zWPqjG4lOFzdrEx4Dh7/JcYHGUvrxSlkSP6WZpNYtuILunz0Y4kIL453BA0CDMYlq2gHitm7EVMC+vU9iRteXh+yOh+LRhx/AJabAp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359701; c=relaxed/simple;
	bh=xjrlPeBG4WNIUU7fpf7l1Xd1y0KhADy+YvMS2wRVdA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sx8d4F9FgaeoXpS/jzFvcREuaE+DecO6pPfguldK00ESaDkaJdHA4FTkySbahFeSKQCa8WYYhFje4KpiVf/Dv+FP8LOcukgkxI0SNlbBOHBbuEonWfDFqXL8BegZluz6fcODn8LJgyb5A69N9o3l6fp4eb80qHrADpF31BjktVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLbMAb9s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514DBC4CEE3;
	Fri, 31 Jan 2025 21:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738359701;
	bh=xjrlPeBG4WNIUU7fpf7l1Xd1y0KhADy+YvMS2wRVdA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gLbMAb9sJJIwnYWk6N6K1/LW630zPucoGYiBtdwDLlFIFq5papYnxtUGIF1nDXE6G
	 AFGZmNJp8Mg7God2MtsrnzqwKL6uNleiIBypkcttBnFycLodU6gR6ElmjjN1/xgzXl
	 B2W1xQZPmmUUieVKYwpf8fBJu/H1R5z2jisbWi96izrMfR14iQGA76H2PpUPVprh4g
	 m/Dx2rURW82kE616fexCWpIBJWlD0/VWb9Hh5RJ+yUF48crQqxz6aco96MH7s6zNbR
	 +Uu0OuGXu0K2gud72MLaNvoaS8P0FZ/sH5xRnYSyXb09iYOF+Cdai9KLOxrdD3y5qb
	 dA/QKJKd8Blrw==
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ce87d31480so7883025ab.2;
        Fri, 31 Jan 2025 13:41:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX75hVlrpCGa6ma6Jn+fJL1f1RJKmVgwhlescWrIJpuUlmcLjgxCqz7+cGKEEIMmQSSXo/t+F6P0yNV8fU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BLKdaXClXrCWeoTpMxl+BkwXaUyq5MxUHUVHyDeYyxaLLbEM
	rYivl0p1yAVbR1RY3U9MCHtEDxBYpmHxsTBwLwVf3U9S7HvNY3IGqZ8HNXsUkoaLMZ21ah79lkM
	/QBTnY/SzTHqnkFC7Ig1sbGkghUs=
X-Google-Smtp-Source: AGHT+IGsRtOKF92cDzqILaRoJNyVEWQl3SaFoHvDWV0af5w3tbe8Hx3MCLHCzCExBblLuM0SzvndJDqxS/xn1MJQa10=
X-Received: by 2002:a05:6e02:1fe4:b0:3ce:5af3:79d5 with SMTP id
 e9e14a558f8ab-3cffe4277d0mr105176065ab.6.1738359700599; Fri, 31 Jan 2025
 13:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131140407.1392008-1-masahiroy@kernel.org>
In-Reply-To: <20250131140407.1392008-1-masahiroy@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 31 Jan 2025 13:41:29 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5GsWe-hV7MwMPbFMDK24W5OAPzjE+HJQjNKQ4CKtKqqA@mail.gmail.com>
X-Gm-Features: AWEUYZnvnI5gCbcie_yGEuQm0lJs01jxgmXraMkjAxhN7ygTbHoevId4pUbOGAo
Message-ID: <CAPhsuW5GsWe-hV7MwMPbFMDK24W5OAPzjE+HJQjNKQ4CKtKqqA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yonghong Song <yonghong.song@linux.dev>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 6:04=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Since commit bede169618c6 ("kbuild: enable objtool for *.mod.o and
> additional kernel objects"), Clang LTO builds do not perform any
> optimizations when CONFIG_OBJTOOL is disable (e.g., for ARCH=3Darm64).
> This is because every LLVM bitcode file is immediately converted to
> ELF format before the object files are linked together.
>
> This commit fixes the breakage.
>
> Fixes: bede169618c6 ("kbuild: enable objtool for *.mod.o and additional k=
ernel objects")
> Reported-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Song Liu <song@kernel.org>

