Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEB12FE4ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 09:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbhAUI0z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 03:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbhAUI0g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 03:26:36 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1202C061794
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 00:25:51 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id x137so93279oix.11
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 00:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dcZ1FYPsDBKXN3hC2IcAkzYMcxDaDlTQqW6wszGPCkA=;
        b=YufljbHlHbmx/xR31VlXerp95BT7cxahfNrgURan972flhmsJdRcjQQZPRQWrNUYh4
         CnnyhIjhUyKVgMeBMcRkWiTtjRH1msLOlPhiWTVc6MPBTrLwIF55Jy/g9n0z5adm/DV4
         9g0IgTn9NeBXXyMQuIXUYV37SgwCy062PaU3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dcZ1FYPsDBKXN3hC2IcAkzYMcxDaDlTQqW6wszGPCkA=;
        b=K77ZezkPG7RojEa1e6xjGdMd76q7/BYK74udpF0j5JM4nu0l2LhJlqKbo/zqlgeF7e
         AUhZB4MUrhOy5jRFwhgytnSgrJfEA/+pVGl2dqgEg+aF7MmSTDFuYnGaVbOYAKa/Oluz
         AGeIVRAsEbV36jmyiHf/lfmWSt2dGjhaD8Ipsm2++R+kvJQ5A55/yyHzJB3Q8e73VPoV
         1DngJ0XU5vqSsxFcQblYis838G/OjyKc6eWkvtChK2g9UFHhF5JE92LuobyFpE1SUQqp
         1qRvgIEi42tYdXX+zL2KyaWbNiExCySbh30oeYPACBronfNz9PGNPjDEktu2m+MCO4hk
         lPig==
X-Gm-Message-State: AOAM531bThnUplKLC0HsSbWxqS1iP1+Rs8WGz6l9lxkbM+DquytGQoMX
        28CzVteBk4wpzMKi7QJ2pbUojI/aPM73YUmbEKxlIA==
X-Google-Smtp-Source: ABdhPJzz0JkV/k4V0avoNCaP5d/Ro05hcp5CHt9s45BuCIcuqAorp3oRURqBTkqgwJQymAvgou+9FyRGO03Vf0s8NqQ=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr5398682oie.128.1611217551051;
 Thu, 21 Jan 2021 00:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20210121074959.313333-1-hch@lst.de> <20210121074959.313333-9-hch@lst.de>
In-Reply-To: <20210121074959.313333-9-hch@lst.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 21 Jan 2021 09:25:40 +0100
Message-ID: <CAKMK7uFo3epNAUdcp0vvW=VyWMMTZghGyRTPbz_Z37S6nem_2A@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm: remove drm_fb_helper_modinit
To:     Christoph Hellwig <hch@lst.de>
Cc:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>, Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        live-patching@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> drm_fb_helper_modinit has a lot of boilerplate for what is not very
> simple functionality.  Just open code it in the only caller using
> IS_ENABLED and IS_MODULE.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I didn't spot any dependencies with your series, should I just merge
this through drm trees? Or do you want an ack?
-Daniel

> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h | 10 ---------
>  drivers/gpu/drm/drm_fb_helper.c            | 16 -------------
>  drivers/gpu/drm/drm_kms_helper_common.c    | 26 +++++++++++-----------
>  3 files changed, 13 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index 25ce42e799952c..61e09f8a8d0ff0 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -32,16 +32,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_modes.h>
>
> -/* drm_fb_helper.c */
> -#ifdef CONFIG_DRM_FBDEV_EMULATION
> -int drm_fb_helper_modinit(void);
> -#else
> -static inline int drm_fb_helper_modinit(void)
> -{
> -       return 0;
> -}
> -#endif
> -
>  /* drm_dp_aux_dev.c */
>  #ifdef CONFIG_DRM_DP_AUX_CHARDEV
>  int drm_dp_aux_dev_init(void);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ce6d63ca75c32a..0b9f1ae1b7864c 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2499,19 +2499,3 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>         drm_client_register(&fb_helper->client);
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
> -
> -/* The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> - * but the module doesn't depend on any fb console symbols.  At least
> - * attempt to load fbcon to avoid leaving the system without a usable console.
> - */
> -int __init drm_fb_helper_modinit(void)
> -{
> -#if defined(CONFIG_FRAMEBUFFER_CONSOLE_MODULE) && !defined(CONFIG_EXPERT)
> -       const char name[] = "fbcon";
> -
> -       if (!module_loaded(name))
> -               request_module_nowait(name);
> -#endif
> -       return 0;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_modinit);
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 221a8528c9937a..b694a7da632eae 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -64,19 +64,19 @@ MODULE_PARM_DESC(edid_firmware,
>
>  static int __init drm_kms_helper_init(void)
>  {
> -       int ret;
> -
> -       /* Call init functions from specific kms helpers here */
> -       ret = drm_fb_helper_modinit();
> -       if (ret < 0)
> -               goto out;
> -
> -       ret = drm_dp_aux_dev_init();
> -       if (ret < 0)
> -               goto out;
> -
> -out:
> -       return ret;
> +       /*
> +        * The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> +        * but the module doesn't depend on any fb console symbols.  At least
> +        * attempt to load fbcon to avoid leaving the system without a usable
> +        * console.
> +        */
> +       if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
> +           IS_MODULE(CONFIG_FRAMEBUFFER_CONSOLE) &&
> +           !IS_ENABLED(CONFIG_EXPERT) &&
> +           !module_loaded("fbcon"))
> +               request_module_nowait("fbcon");
> +
> +       return drm_dp_aux_dev_init();
>  }
>
>  static void __exit drm_kms_helper_exit(void)
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
