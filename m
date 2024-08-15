Return-Path: <linux-kbuild+bounces-3027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E9953B82
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 22:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CC41C21AB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 20:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C86405C9;
	Thu, 15 Aug 2024 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WpKP8ODp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B33F9FB
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754019; cv=none; b=o8mkITr1AMW+N3ukS/UzsUrGOPjztZo0LPPCL0pssqgP/PdInZJ3wSR0OCkJF3/zxxa1lW9kJTJ1TNvb1MSbjhM4WVM8dYplG1i5JIUMAoTUWBSC3RSRLcEBj3vsWLLb9t39+tR9A53Ztn5eE7mCcxMcK+MDqkLcKua8EyB2ei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754019; c=relaxed/simple;
	bh=yWgGSLGOThht9VH1j8idNnJEliC54nmoFZTchKoyGCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlH9chyQbDQFPCV+IotCKubBZqt6mt+Kt/fUorX/Qk9Kq/1wsxV/4pbsr9BZZQ5fSgffVev1fINZQEDtq/q1ZR84leO6qUkmRMoXDK0LiNzQXWzeqXpduWWMgw8tDdxFVxCy/1no7k9u7SvvxVW3a+Xr8RJUR7FThYYqguoFF5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WpKP8ODp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7a0e8b76813so1066687a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723754017; x=1724358817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZYQi9xwN/ftJaS5tNR+bMWngN/wkqekW+vaelWSzms=;
        b=WpKP8ODp0XNN5ZZIjBzGZQx8aTqHTkeCXWiyw3wUIpBO9AWmYcrzlyHZajKj7cpZ4f
         ERzAdrIve0iFNxVk7Ou0aY3xhjkQyPrrwAK28KF7qEn+ZHCF0bTYEwm/Adm6QfQsXiaP
         qrKZA+FiJ6voMus72kHhcJNIelMRFpGV6TGZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754017; x=1724358817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZYQi9xwN/ftJaS5tNR+bMWngN/wkqekW+vaelWSzms=;
        b=QKY4XwCfadgfmcM3iSMUOJmxXCaJ7LoqWZz+IRhLGf6RKRp5JJYTHc/egvXQdZRkM2
         rXdAz2th39OpKjqn7xCvKPcYBXx2z64uQDYCgL2kar3/jQrqg9aP8w8DFIsm6MyWPenw
         dhhVawuFQiamLqDM0qMTbI9/AkxQyfxsShNv+jrZ0V4vymbY2tfUlTHj/8eNaZZlicgT
         MqgBUFtlMZIlhGt8qFNZ/75xPG9ISueKUG19aKq3lCSzHf5n9MkeFp2xbhLh1zqq96Ri
         UPbUcQVML3PNc8bhnxPYVylZ93OQxd/cTcRPLfOPfiqwxhx6QIs0Pg8XV2zxcgGS0O0K
         Ct7g==
X-Gm-Message-State: AOJu0YzFdhU5+MzSxZxmpGmsYNT/y9x/w8BL/2vlpP8RmvC8MhjVDiQ9
	jYs/aQcBli5upJ6g4ijXKUE/qEW4zPE9AKPTudt7U8t3Q5UV5X0BvQBcLs3l/oCrSZV8ML7tyJA
	L6OdTxohseWOmszs5kr3yXEfkOAAPGNUBuW4e
X-Google-Smtp-Source: AGHT+IE8sXl5TRuroUpX08SMIpHfIuXYkSFHFxH1REdFvFWp3aLBzootVRVLAsvbeTE4E9zARsIpjvo3aLXe1xnWc2Q=
X-Received: by 2002:a17:90a:ca89:b0:2c9:754d:2cba with SMTP id
 98e67ed59e1d1-2d3dfc2aa3amr1054897a91.3.1723754016864; Thu, 15 Aug 2024
 13:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815110059.4912-1-tianyuanhao3@163.com>
In-Reply-To: <20240815110059.4912-1-tianyuanhao3@163.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 15 Aug 2024 21:33:25 +0100
Message-ID: <CAFLszTjFvMAEp=0b3aKng_0W+TOQces=TfpfTYuE3jNUqt4qNg@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: Only build dtc if needed
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: linux-kbuild@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi TIAN,

On Thu, 15 Aug 2024 at 12:01, TIAN Yuanhao <tianyuanhao3@163.com> wrote:
>
> At present Linux always builds dtc if CONFIG_DTC is defined, even when
> DTC is provided. The built dtc is not actually used, so this is a waste
> of time.
>
> Update the Makefile logic to build dtc and fdtoverlay only if DTC or
> FDTOVERLAY is not provided.
>
> Also, add an fdtoverlay wrapper to hide the actual path differences of
> fdtoverlay from the make_fit.py script.
>
> Refs:
>   https://github.com/u-boot/u-boot/commit/93b196532254366f653b4d763f69e49ff193f06c
>   https://github.com/torvalds/linux/commit/6b22b3d1614af1a775f2ef006009f15077592c9c
>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Cc: Rob Herring (Arm) <robh@kernel.org>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Makefile              | 13 ++++++++++++-
>  scripts/Makefile.lib  |  5 ++---
>  scripts/fdtoverlay.sh |  7 +++++++
>  scripts/make_fit.py   |  2 +-
>  4 files changed, 22 insertions(+), 5 deletions(-)
>  create mode 100755 scripts/fdtoverlay.sh
>

Reviewed-by: Simon Glass <sjg@chromium.org>


> diff --git a/Makefile b/Makefile
> index 0a364e34f50b..6e56696e85a1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1419,9 +1419,20 @@ endif
>
>  endif
>
> +# The dtc and fdtoverlay are automatically built unless DTC or FDTOVERLAY is
> +# provided.
> +DTC_INTREE := $(objtree)/scripts/dtc/dtc
> +DTC ?= $(DTC_INTREE)
> +
> +FDTOVERLAY_INTREE := $(objtree)/scripts/dtc/fdtoverlay
> +FDTOVERLAY ?= $(FDTOVERLAY_INTREE)
> +
>  PHONY += scripts_dtc
>  scripts_dtc: scripts_basic
> -       $(Q)$(MAKE) $(build)=scripts/dtc
> +       $(Q)if [ "$(DTC)" = "$(DTC_INTREE)" ] || \
> +                       [ "$(FDTOVERLAY)" = "$(FDTOVERLAY_INTREE)" ]; then \
> +               $(MAKE) $(build)=scripts/dtc; \
> +       fi
>
>  ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
>  export CHECK_DTBS=y
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index fe3668dc4954..04ba30dadc8f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -352,7 +352,6 @@ quiet_cmd_gzip = GZIP    $@
>
>  # DTC
>  # ---------------------------------------------------------------------------
> -DTC ?= $(objtree)/scripts/dtc/dtc
>  DTC_FLAGS += \
>         -Wno-unique_unit_address
>
> @@ -415,10 +414,10 @@ DT_CHECK_CMD = $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR)
>  # recorded in the .*.cmd file.
>  ifneq ($(CHECK_DTBS),)
>  quiet_cmd_fdtoverlay = DTOVLCH $@
> -      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
> +      cmd_fdtoverlay = $(objtree)/scripts/fdtoverlay.sh -o $@ -i $(filter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
>  else
>  quiet_cmd_fdtoverlay = DTOVL   $@
> -      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^)
> +      cmd_fdtoverlay = $(objtree)/scripts/fdtoverlay.sh -o $@ -i $(filter %.dtb %.dtbo, $^)
>  endif
>
>  $(multi-dtb-y): FORCE
> diff --git a/scripts/fdtoverlay.sh b/scripts/fdtoverlay.sh
> new file mode 100755
> index 000000000000..5bd07c47c22a
> --- /dev/null
> +++ b/scripts/fdtoverlay.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# An fdtoverlay wrapper
> +# scripts/make_fit.py uses the name of this script as a special marker.
> +
> +exec "${FDTOVERLAY}" "$@"
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 4a1bb2f55861..37c4e1c8d5c6 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -238,7 +238,7 @@ def process_dtb(fname, args):
>          with open(cmd_fname, 'r', encoding='ascii') as inf:
>              cmd = inf.read()
>
> -        if 'scripts/dtc/fdtoverlay' in cmd:
> +        if '/scripts/fdtoverlay.sh ' in cmd:
>              # This depends on the structure of the composite DTB command
>              files = cmd.split()
>              files = files[files.index('-i') + 1:]
>
> base-commit: 6b0f8db921abf0520081d779876d3a41069dab95
> --
> 2.45.1
>

