Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD4226E812
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 00:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgIQWRH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 18:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgIQWRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 18:17:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114B7C061756
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2020 15:17:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fa1so2035594pjb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2020 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=15AUeIGCB8Co4ppPyHutmBPEoR96J0ZC+70DS6d6lEA=;
        b=HbZxUoaquDF7xsCL0N1nGOtEhjC6k/29ufocwCgKegfzTw+SnKB4PHA5efYOqvK5H8
         qB29ehLrJeRvDiCO8wPb8MQdU7Q2icOOK5ZQA/+5FaVUaFbhQF8nbM1rBfgWZ4QUsvuy
         i0+a0YxbWmt8uHoYV7J6SZv0i7QqbjjxftLFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=15AUeIGCB8Co4ppPyHutmBPEoR96J0ZC+70DS6d6lEA=;
        b=BsbhQdUx1SBi4Zd+Ow77aEzttgw+DtgE/DtkRiBtmaPIrZuICqIpPz8Y1IILY9bRzE
         aC1lCg/aHROrB7YANIfSXttmSBCNFveiqXr0VBauIHp5SG+/g/SdMeXwDdx05vIZbdKO
         3CSbWJ8qqBSje7EGf/eIqhVUE86b0tJosccOj3d5iDIwwvQMo/PK56C+jOSCP0IXZ228
         zElwaEwt48VIG2Sj8adpw2QPkbEm5wy1RK01EHCGQmkVgmmwERoHwljPFdb61pgOMj+2
         0o1IckXabh/VRU2Z2GzEDbqlqjMUfTN3KCcOsdLjxAXTcLEYyQG+ggWQtoy8nH8J/3pY
         JF5A==
X-Gm-Message-State: AOAM533TD2jkVeDfcEfrR4r1jDGDkvRFIwVYzadNAE3ND6XznX7wu8tF
        xnG0c5xD4Y6V68cPLuBpSpx4tw==
X-Google-Smtp-Source: ABdhPJxoOnxlx8CTv3DWk2KqkOMYm+QxpzLZyBZuGVpXsjrtygCBDQZLnqcz+qPsh63Ko+YuX/aNpA==
X-Received: by 2002:a17:902:9343:b029:d1:f3e1:c190 with SMTP id g3-20020a1709029343b02900d1f3e1c190mr7793977plp.2.1600381026580;
        Thu, 17 Sep 2020 15:17:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h35sm626057pgl.31.2020.09.17.15.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 15:17:05 -0700 (PDT)
Date:   Thu, 17 Sep 2020 15:17:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     George Popescu <georgepope@google.com>
Cc:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        ascull@google.com, akpm@linux-foundation.org, dvyukov@google.com,
        elver@google.com, tglx@linutronix.de, arnd@arndb.de
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
Message-ID: <202009171516.6543C7649@keescook>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-7-georgepope@google.com>
 <202009141509.CDDC8C8@keescook>
 <20200915102458.GA1650630@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915102458.GA1650630@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 15, 2020 at 10:24:58AM +0000, George Popescu wrote:
> This would mean losing the local-bounds coverage. I tried to  test it without
> local-bounds and with a locally defined array on the stack and it works fine
> (the handler is called and the error reported). For me it feels like
> --array-bounds and --local-bounds are triggered for the same type of
> undefined_behaviours but they are handling them different.

Er, if --array-bounds still works on local arrays, what does
local-bounds actually do? >_> :P If we don't have a reduction in
coverage, yeah, I'm fine to turn that off.

-- 
Kees Cook
