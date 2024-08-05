Return-Path: <linux-kbuild+bounces-2816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ABA94780C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 11:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C99282689
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 09:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA61A14B965;
	Mon,  5 Aug 2024 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eEnZUhH0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2926C1428E3
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Aug 2024 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849187; cv=none; b=ojN1nLz4ES6NaeFkkVn4Bd2OIeU4iD1hPb/viTJ1Ief5wgGUCB6oBZmFPchqUUD7eSJ0XAOwGkNR8/pUr4olsIikEaEjVCwJOxys3q5qEmdlNVVSmVCihL/VbV2B28XozZGrlVc9jJjNPI1EM9bJjoSsl/T30PHt1uIxLWFV/yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849187; c=relaxed/simple;
	bh=b6PtRxqw9Cj7kNSDE179d9U4xRbrLqjwN7s7lGTPBh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAYGez36LS9LvhBCGgQw8JNrzxbIBWIb0of5g0js3gf8hupbdvO+AHEwx4hcQ3Pzxvxzhv/DD1mXdCgOxHVH/EGiemG3h4Oy3+yhKUI1ZN9dPOvURvcG/pr/6sN5XLmO3CqIcfbiJmkQDeS92YvViUGWm7PKFsxhJzo5DCow4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eEnZUhH0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ed741fe46so11473097e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2024 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722849184; x=1723453984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y8FdFc+qsM3naUQ0bWiJHr9+LVojpJOgQ3oksPbyK08=;
        b=eEnZUhH03rl4Uy/vdlyQDYLdiPnZhf1wOiTWGMS1xjCHDBR6PNwb7TMWQfhGCk0Qey
         JAWoh9fh5rXiIQpTDvliD2PzKl/GGiWFBfRHfYmu9QEXxzRIT0JmuxgTw2VOnEsWZwEo
         Op38IASp0mAaj9E6m/+Qib3YqZi0KkYquWJzgWaJ1yN/v77CIbRrfShn0TAh3fwtqA9c
         +N3uim4OdCnSX4U3WRNQH+zQPX5dK/91ySzjLQU5t+8wSLKMtBb+hzsn28bqKd+ncSQ4
         qCimFYLqDm9EU+GYRcKVFIIGPwUALbmUMlljYzPFENgPIiZmLqvzSkBFjwGHKaomsIgu
         baQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849184; x=1723453984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8FdFc+qsM3naUQ0bWiJHr9+LVojpJOgQ3oksPbyK08=;
        b=bgmWZNmCrJqoeWdaJYm0iry8zDSlfQ4U5Qvzu35G4xkVAJIGIIKnaSLyWOLSENlsqE
         RQ+xI94Qduz84HdeBGLU0qe3kpcV0nAzhME3A4IMFRhWnP4Xq2x4jUTo3GPHSHc2O5gq
         UTjLboNn16i060Dz/bIlsvXowHqAP6Bmlp/ncsYJLl8FPAZEmEBHH2EgB1nsASZQbkNS
         esAERAFdTm0BvLV5UGUQHSOzUMcsKgx1atunstSkjYE2y9lFODZVru5/nRI/V22tqXia
         4dvONmo5Gkw2SZQNMPzqfy0cvb9cslnvnkzTV/khQOR5wy4RdQZBsjt11kaUe1sdummM
         z0Gg==
X-Gm-Message-State: AOJu0YypTK0gDS6wHDCyGaybyOT/MuI/m/HxPlhmMuyAAR4sHR8MtyJc
	3E0zQi8nYzHLjb+Ok7/N8P/hhYyxNkIB0aDAFiZY0Zr1uHHGFlPG7p5hGlRVBER8b7I7tlW69Gv
	LpJszKb/ifKuoM1FvztPDIgZTFSV3UfSQ4jYg
X-Google-Smtp-Source: AGHT+IF2IzJVJAFgRlWDpNIWsidM5Fj2wPpC7cv6pEyFKP95u6M9uTFbOnXNAYb4CIiAzqTh63625eOVXY2CgIRpRGg=
X-Received: by 2002:a05:6512:104f:b0:52e:9b92:49ad with SMTP id
 2adb3069b0e04-530bb354fe8mr7070890e87.0.1722849183977; Mon, 05 Aug 2024
 02:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805090901.53986-1-gprocida@google.com>
In-Reply-To: <20240805090901.53986-1-gprocida@google.com>
From: Giuliano Procida <gprocida@google.com>
Date: Mon, 5 Aug 2024 10:12:26 +0100
Message-ID: <CAGvU0Hnm5V1EpY+TfWqq5XHVJUSSxa=wHCZ+yVNb9+Ln=7mbkw@mail.gmail.com>
Subject: Re: [PATCH REPOST] lib/build_OID_registry: do not embed full $0
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-team@android.com, elsk@google.com
Content-Type: text/plain; charset="UTF-8"

Please ignore this. I see other people have already posted different
fixes achieving much the same goal.

Though my change was much simpler!

On Mon, 5 Aug 2024 at 10:09, Giuliano Procida <gprocida@google.com> wrote:
>
> Using $0 makes the output of this file sensitive to the Linux build
> directory path. This is problematic for reproducible builds as it can
> affect vmlinux's .debug_lines' section and vmlinux's build ID.
>
> Signed-off-by: Giuliano Procida <gprocida@google.com>
> ---
>  lib/build_OID_registry | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/build_OID_registry b/lib/build_OID_registry
> index d7fc32ea8ac2..06f242202036 100755
> --- a/lib/build_OID_registry
> +++ b/lib/build_OID_registry
> @@ -35,7 +35,7 @@ close IN_FILE || die;
>  #
>  open C_FILE, ">$ARGV[1]" or die;
>  print C_FILE "/*\n";
> -print C_FILE " * Automatically generated by ", $0, ".  Do not edit\n";
> +print C_FILE " * Automatically generated by build_OID_registry.  Do not edit\n";
>  print C_FILE " */\n";
>
>  #
> --
> 2.45.2.741.gdbec12cfda-goog
>

