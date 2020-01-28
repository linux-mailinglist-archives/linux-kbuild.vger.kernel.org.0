Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA6314C28B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2020 23:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgA1WE0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Jan 2020 17:04:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33259 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgA1WE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jan 2020 17:04:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so7748394pgk.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jan 2020 14:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DblaotVrzmiJAt9+53QxoLYrUdovyBVm302zCUUqNls=;
        b=rWPko/byJB87I49+00Q3KlR4jrifheZTiFsxG2JcsG5fcLPjIYHOPcExcjdLHA4Ekb
         xdUFWgMnMQzspqDKLljFRRe8nTyKHLitIZ/+R5FlJgnf/T9YZNy6hIs/P/ZEzFSR7/UF
         9b3N6RFxb23BLihLWj9cXneJel3Gh93P1K6Wb0YTC232j0IWQtKpQMLNXJdhi9jgoXsQ
         taOITzUWLJ0eKmK6OzyItm8Tz9nbXq6ljYxfFJ40K6vkJ2Y6vuxtBJNwfk1GxT6USzFO
         P06M4uRKcj5AvPCEDctF/2onv8ILLd5QuTUDrMcMtahQU8zYCmcBOP3e5bva2+tgrgXL
         Ud6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DblaotVrzmiJAt9+53QxoLYrUdovyBVm302zCUUqNls=;
        b=FCY4ZiBrR+FHSsjddsZ2sxygrl3oZhtMxEene8t1T5xNyEHJQfqqMOOE/hmf49uKIQ
         jb6YB+Y1TWRkAVr75uTUQUYl08sx51HgflqQaEzOcdw0lhUKQxio0t4THoOpNIKVtUVC
         yPgkOPeX0NzJD59kcCp5X9ak50q0Lnr+g/ShFkshNCgB8Qi4Wj8c1zYtsRk1UaRDmpze
         xlpp/UKSWhLD/+kA8WBa+f9FFYBOT1G3sAjgYrZuTRu1FPTSwNr1VHXZEJmNb18ZNr+v
         yEH+0pZqFhTadmlAQpydkroSiNpc4Ya1qGHe7APcn1R7JdDRu10z0Fu33p5XrxQx4kG3
         4S3g==
X-Gm-Message-State: APjAAAWoDUZLnOAlBsfGiaH7qBPWxul4YDK3xFBAVjKiqW4DnpnqoUck
        E2KAbevjPsyDJJnlD7C0RNV3yfep
X-Google-Smtp-Source: APXvYqyvV28ePW6IB/gvAeu01eoPTXaCsy3lsyFfIjUxoiLsSbpZ45sJav0udDnUbZz8mQUtqgfPnQ==
X-Received: by 2002:a63:465b:: with SMTP id v27mr27929484pgk.257.1580249065809;
        Tue, 28 Jan 2020 14:04:25 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b5sm20047pfb.179.2020.01.28.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 14:04:24 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: bcm2835: Drop select of nonexistent HAVE_ARM_ARCH_TIMER
Date:   Tue, 28 Jan 2020 14:04:23 -0800
Message-Id: <20200128220423.13270-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121100150.31660-1-geert+renesas@glider.be>
References: <20200121100150.31660-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 21 Jan 2020 11:01:50 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Unlike on arm32, the HAVE_ARM_ARCH_TIMER config symbol does not exist on
> arm64.
> 
> Note that the toplevel ARM64 symbol always selects ARM_ARCH_TIMER, so
> support for it is always included.
> 
> Fixes: 628d30d1ccb897fe ("arm64: Add platform selection for BCM2835.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to soc-arm64/next, thanks!
--
Florian
