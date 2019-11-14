Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08BDFC002
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 07:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfKNGCo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 01:02:44 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:35194 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfKNGCo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 01:02:44 -0500
Received: by mail-wm1-f49.google.com with SMTP id 8so4507637wmo.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2019 22:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=0VEFjetxS8gBhGDE9MAAh++nX0NrT9Pwb2y30JCH/XY=;
        b=KvK1UXZpmih19FKKTKMQ5FpEoia+2ekZGxDsHMVdFldIxvg3gMNYKPJx+jXqNCxt1O
         VJzsz4LkkLyM6OSJDjdSli9tUkP28agW+KU/MMXg/7dAzItW/Yb4z6fJNvYnBleG5ATy
         Flo6a7Zw8jNqcNN6v7HZVUL1BzYdprvNJmYcnOWf+ckCjv+k6+Y/ApUGh9N4bOiBItKp
         U1kptTnbmavMeqtJqXLI032aZpEaWZIV/9RimMWK2d6FMihIKYUw4mngU1FtgMkAkgpl
         SRYsp+IuwryZeUKIgTZeOFmSsduDYrSfEDh4Hfyb4B6vjXnHPwaNaC204CgVK/fJE3U5
         fAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=0VEFjetxS8gBhGDE9MAAh++nX0NrT9Pwb2y30JCH/XY=;
        b=NzKqM71lRh1uo060IofzPHt6keovFXNQRvSZa/KyCGEHV1MjP1euloY4/yYWLkb31E
         rQh4dasucU25GqtbHayBNm08WrJ2JRE36Z4Prssgk99+eZh9QXEhiJF8BFR5mh1kQfLv
         0SVaYNPDc9ttH4T3RsEIJxRzzDbybcVuk6HkmmIsJIvVdOy17kOXdnwmf5O+X4Rdt2NR
         iKsq0j05i2WuaTP/nj3az9cqRoRu6HIFhNH9V4Yx3WMHpSsGbHrZqKRftwDVrqWytVIx
         uL5KzZU0qTXI6a6+cz1LBZMZriyqaVAKN9Jr/KllRV0853rpZR/VKeU/bEz1XQDIZFkc
         dDDw==
X-Gm-Message-State: APjAAAWGYGy9xY19TR6vcAdnk8HbvdIX2rADqzU+gRD0yeHM+pH4dEX4
        bO9qs2o4DB86M+ToDf193wU=
X-Google-Smtp-Source: APXvYqw2R2essy7EOHQEvliJ/si6x4MFb7t5hHY9o6V+uTMzSQJWrb/K38Hg7N+Ovn0WV/ihvItLgw==
X-Received: by 2002:a1c:7708:: with SMTP id t8mr6072552wmi.29.1573711361895;
        Wed, 13 Nov 2019 22:02:41 -0800 (PST)
Received: from oxygen (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id c4sm5769994wrp.86.2019.11.13.22.02.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2019 22:02:41 -0800 (PST)
From:   Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
X-Google-Original-From: Vijai Kumar K <vijai@oxygen>
Date:   Thu, 14 Nov 2019 11:32:36 +0530
To:     yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        michal.lkml@markovi.net
Subject: KBUILD_IMAGE-reg
Message-ID: <20191114060236.GA13066@oxygen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi All,

I see that we have moved from directly using KBUILD_IMAGE to "make image_name"
to decide the image to be included in the final deb package. Long ago when
I remember we could override KBUILD_IMAGE in the environment to include
the image of our choice in the deb pkg.

Is this possible now by any other means? Because there are times when I
would like to include vmlinux instead of vmlinuz and just wondering how
one could go about accomplishing that.

Thanks,
Vijai Kumar K
