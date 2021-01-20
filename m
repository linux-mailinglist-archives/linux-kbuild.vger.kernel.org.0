Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA60B2FDE18
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 01:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732098AbhAUA0l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 19:26:41 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:36556 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730652AbhATVkO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 16:40:14 -0500
Received: by mail-ot1-f43.google.com with SMTP id v21so7069524otj.3;
        Wed, 20 Jan 2021 13:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7CQ3HB1nTNFRMwomepbdzCXSM0Vunqc4+WhRW4CgReg=;
        b=EoVhPifZeKWe9ZHumV2OIz5KoVESejoU8hf/s630VQR9cAlZ2CcUh5TcnHHWbcSzJb
         hiPOx4Sp6p7tmordMDjiJR62kTniopVmv2R+FXkIlFl4y59Yz/qmZi17CGtd0OzeDkY0
         dtn7ZMveBksX68tgXN7BdKebwle+qNw9IvYxRbwMa6av0ubqgv/cCRLvCmrXOxEXLqCi
         t1SMJWUFRwZOyy06UHKV9H1b5PIE5+7F1TvUN/Mw40ojsFhZsN1/K5tF58XbRmfYeEKE
         UnVawYQQdqGScQ50x4UmlVNleXRRNNRRgwDgpKyllzbFWp5+naj6pXo7bztDdiRM2T6K
         cHOA==
X-Gm-Message-State: AOAM5320D4Bhu+dgqMSordN8TzmRmZh8UoZejdmh27FcaUAGc+EWuZHL
        /BpjiQaL+SaINT2bVD8eSw==
X-Google-Smtp-Source: ABdhPJzGDS+Z9qNM9dct2YDH/2pXy5NEBm+Yj/vIMrRQLRDGQVMBKKxSHAjSx6WNW2sbX8BiGlOZHw==
X-Received: by 2002:a05:6830:1e19:: with SMTP id s25mr8204614otr.249.1611178772240;
        Wed, 20 Jan 2021 13:39:32 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 70sm657133otf.39.2021.01.20.13.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:39:30 -0800 (PST)
Received: (nullmailer pid 880940 invoked by uid 1000);
        Wed, 20 Jan 2021 21:39:29 -0000
Date:   Wed, 20 Jan 2021 15:39:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: use always-y instead of extra-y
Message-ID: <20210120213929.GA875847@robh.at.kernel.org>
References: <20210120062351.3011786-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120062351.3011786-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 03:23:51PM +0900, Masahiro Yamada wrote:
> As commit d0e628cd817f ("kbuild: doc: clarify the difference between
> extra-y and always-y") explained, extra-y should be used for listing
> the prerequsites of vmlinux. always-y is a better fix here.

prerequisites

Glad to see this clarified. I think just tried both and picked one.

Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile |  8 ++++----
>  drivers/gpu/drm/i915/Makefile              |  2 +-
>  scripts/Makefile.lib                       | 10 +++++-----
>  scripts/gdb/linux/Makefile                 |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)
