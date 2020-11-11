Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A452AF68E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Nov 2020 17:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgKKQbn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Nov 2020 11:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgKKQbi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Nov 2020 11:31:38 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD5BC0613D1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2020 08:31:38 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id 199so2193999qkg.9
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2020 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=yV3zhMsaAUeFu6z49iuIfq0V/xXURbZ7s20z6PPsuuw=;
        b=tyQm2CLLTFdFGFQBJ6j+2CDWUcJDS5OAcAXSIZxcmkI3D7qSA8ejeHT/Hzchi4srTT
         FANmc3/0/99eg4WTVS387WmDZcdUYVvo/1824BYAV+q9a1XskDWlw0527AAb0xOYTloV
         vLM0uz2m+BHYNLBLT286vhz26CWa2dF7W00fR51XqzqzHl3KtUm/id0dtO/1VW3KXzQ6
         QQZwGQu71GQ7YkMlpKaqxmtZTASQWWYfJMsgc7adr0zJFF+bsTBaFsPBmJWElYHiLxAZ
         h6BAvQ0NHr2y9ZBpuSKKitnAFXoyCRvmCyH7EvUGeD1UKRo5Dq3jHLPnF8i9zbodFk4B
         MDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=yV3zhMsaAUeFu6z49iuIfq0V/xXURbZ7s20z6PPsuuw=;
        b=jqNOouYNizGUbpf2ZoUTVsr9z1BQpcQ7uhqIuG7I6B7mnHsHVen9GwQP7Zf49BI9nM
         aGolisOG7DmlZlHEhmEgQyNxcomjsuvwsf0POIqqDwhTOzL7SyqPJFFdCw6Le+gG4hpS
         /cq3giiVW8EyBOklCDS7O75uMuTI7I9wRHFn1FhJekm5F+cquoKLGpKfHT4QThZaxllT
         /jL4seRU5LL3Qfg2ooUbJDbSaAQ2ye12ZEkjHYNhWDCcace2b6Bnu68ENwVWTp/aKLbY
         Lzk5cbTAGUgZeAxqnODWh3d1WPaAjXpWTDD7D+1e2fYFnK7/GeLmAMv8khRlgfQHBTlh
         4Ksg==
X-Gm-Message-State: AOAM5302brl0c9mynfgrFQ84hX2UIKX5goy3JOP+oQ8vbUlM3uyxOXRg
        sQFwtjjF7ZgolCVpfB45+6CobnolEW0=
X-Google-Smtp-Source: ABdhPJzuFi0ipMmcOoN/PgzUzUtWW7oNMGglRbec+1QcamW0fkMuwRvwPk5IX/f6HbYKaijICyqLrg==
X-Received: by 2002:a37:bf02:: with SMTP id p2mr5233402qkf.399.1605112297086;
        Wed, 11 Nov 2020 08:31:37 -0800 (PST)
Received: from p51.localdomain (bras-base-mtrlpq4706w-grc-05-174-93-161-125.dsl.bell.ca. [174.93.161.125])
        by smtp.gmail.com with ESMTPSA id l46sm2778729qta.44.2020.11.11.08.31.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:31:36 -0800 (PST)
Received: by p51.localdomain (Postfix, from userid 1000)
        id A68AE1D171F2; Wed, 11 Nov 2020 11:31:35 -0500 (EST)
Date:   Wed, 11 Nov 2020 11:31:35 -0500
From:   jrun <darwinskernel@gmail.com>
To:     linux-kbuild@vger.kernel.org
Subject: unwanted built-ins
Message-ID: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

hello,

why things under drivers/gpu/drm get built despite CONFIG_DRM not being set?

i'm cross compiling for armv7a and pass this as KCONFIG_ALLCONFIG to
allnoconfig:
https://gist.github.com/257/d69a5e95bd42cd7db5f1012703113fd1

if i take drm-y as an example; it seems to me that drm-y should only be built if
CONFIG_DRM=y|m according to this line in drivers/gpu/drm/Makefile:

obj-$(CONFIG_DRM)+= drm.o

final .config has this:

#
# Graphics support
#
# CONFIG_IMX_IPUV3_CORE is not set
# CONFIG_DRM is not set


thanks in advance for help
-- jrun
