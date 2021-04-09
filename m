Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759F9359282
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhDIDJD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhDIDJD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:09:03 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AC1C061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:08:51 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g35so2805940pgg.9
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h3/zuAkLa/ADOI4qQOD5EyWX5f7zNMFVEr3AGRbxlzs=;
        b=Qu68/UtbNay6Ey8RBiWsqTf7H769Hs16vmlRffRA305itJafW9w8eOhm2Ks/ZI5lRW
         MO6vcAGxVhQDBFf6O80cqlCf31Ae8d44QgEsiuUOhKnoHv8NjDmFO8f8sZ2dcabZROgI
         LSWCTwdC7ovN6o7lj2OP2rTjHyPpV+ySSgqD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h3/zuAkLa/ADOI4qQOD5EyWX5f7zNMFVEr3AGRbxlzs=;
        b=I9SCpxuBounVwPGkQFt4jlgLjh3upt3SnhL/Rq3B2cU3N0C2rszPbnrz9ODS1KC5wP
         eduT1HVwMUTeSMTIlJOswwaGwSLX1BeB891PGNKEnWmGJCO4pd7/t8fwme9JyI1jo24h
         YmB4ZOZWmMkOLNvIEiWhkFy95SxCxylSRu6ED9QX/AeyfVZr/KYVBpBnXR/NDILo1GXo
         ttCHAfSoXlRvc9ojk2EGLLbh43Voe6IUaYgBv7V3sAaPGNLN94E/EHSVRFHOpJlR02/G
         zvUj6c5kaXx2bw7NeoYnj58w7bN6ETHGHWTajVDodeJlZu2I0+H36jELIdShcsD8gOR0
         2ouA==
X-Gm-Message-State: AOAM530QCN6AUcyyjbSqKTTInFEenU8KbOxd2/5adP7Ptrmfs/4TRgrd
        MYjk1jtMyqkMEvbcAC+L7bodDg==
X-Google-Smtp-Source: ABdhPJwHogY0DATf5duyo92TJZmtUJWTBk3mjGIjRNGLYYG5MoEeyaiDAuLca/mdUjjXd4N5OWUM5w==
X-Received: by 2002:a63:390:: with SMTP id 138mr11306786pgd.8.1617937730705;
        Thu, 08 Apr 2021 20:08:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i14sm625160pgk.77.2021.04.08.20.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:08:50 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:08:49 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/20] kbuild: scripts/install.sh: prepare for
 arch-specific bootloaders
Message-ID: <202104082008.25EB080@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-6-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:04AM +0200, Greg Kroah-Hartman wrote:
> Despite the last release of LILO being in 2015, it seems that it is
> still the default x86 bootloader and wants to be called to "install" the
> new kernel image when it has been replaced on the disk.  To allow
> arch-specific programs like this to be called in future changes, move
> the logic to an arch-specific test now.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
