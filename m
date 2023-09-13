Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D64279EAFF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Sep 2023 16:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjIMO0F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Sep 2023 10:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjIMO0E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2023 10:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4256391
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2023 07:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694615118;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=i1FsUnDJXEh3xrup97UKPyi5G29wmRkoOl4jHD/nSRg=;
        b=BebGtRFZaDxf8v1/Xc6D2VgbyXXjbwFZTAQloOXB9JjdAlV3jJB5sKjPhQhf/3UIU1qDnD
        25v4FBwjHMMP0t6FRM73DqMGwx8PxFNu/aI35/0iBWgTjuJrB4etv6PYT50fqchxlq5c//
        dot1BKBEFz5SxJcKcZ4+dC99nuRqBxo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-MGPLC2rcMpG2riZRJCzUwg-1; Wed, 13 Sep 2023 10:25:17 -0400
X-MC-Unique: MGPLC2rcMpG2riZRJCzUwg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4011fa32e99so51997045e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2023 07:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615115; x=1695219915;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1FsUnDJXEh3xrup97UKPyi5G29wmRkoOl4jHD/nSRg=;
        b=bZuosFm/KvH6cbEk1ZqKGQKRKdD5jcypR/zGHepzSPNsIvbGEojutRWGS0Rr2Rl2Pp
         aRE4akDSIsuHsv3+d96xInJ5dbPQN+jhCYqN4OjqCxjWvCiQSk+yjP1y099r3AVD/FLA
         4zBm7IwN17yfRYhl3/SoRZt9huo3+fxT5NxiC8KuW6/lsJwANWmACYwkfGPIYpuu5aI4
         4P939+FhPap3w4dOHUzdQjYZUjDt8DysHvG+qnBusoUNhVX4o4JwA2Q/GdMAA9KY+CyK
         A8iY3ZQafsf/xMowp7btpiLawj9foxlR5BTTSs3T1Kw1PvVtfVMAFiOJKudSNMrr3nLE
         apbw==
X-Gm-Message-State: AOJu0YxjwzLWIEces9D8oX5xsfa+Cm8IM3MrK6MACGBE8OkNy/2YKq6H
        3SkKZcgTRyM4WHmPG1YoepgOAVqDO0Ta7bO+zSrS1+5XRwfhFxPF651bHqPthLx5Tk+KWm+vfWj
        iv0tew/j3tzBVBgXaYMS50UmVBvgOqgQX
X-Received: by 2002:a05:600c:3b10:b0:402:eab6:e704 with SMTP id m16-20020a05600c3b1000b00402eab6e704mr2127403wms.29.1694615115676;
        Wed, 13 Sep 2023 07:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN0t8yz3+zH7LDMFjVxmF3tnVkdjJhcoCATJjm6CztmjCnnjLfigAOYlLj+//qxaHPIO3cjg==
X-Received: by 2002:a05:600c:3b10:b0:402:eab6:e704 with SMTP id m16-20020a05600c3b1000b00402eab6e704mr2127388wms.29.1694615115372;
        Wed, 13 Sep 2023 07:25:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fe4ca8decdsm2186260wme.31.2023.09.13.07.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:25:15 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: explain handling optional
 dependencies
In-Reply-To: <20230913113801.1901152-1-arnd@kernel.org>
References: <20230913113801.1901152-1-arnd@kernel.org>
Date:   Wed, 13 Sep 2023 16:25:14 +0200
Message-ID: <878r9a1779.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> This problem frequently comes up in randconfig testing, with
> drivers failing to link because of a dependency on an optional
> feature.
>
> The Kconfig language for this is very confusing, so try to
> document it in "Kconfig hints" section.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks for writing this since as you mention that Kconfig idiom is not
intuitive. The docs looks great to me!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

