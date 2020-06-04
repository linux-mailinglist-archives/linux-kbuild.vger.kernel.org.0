Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9451EED5F
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 23:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgFDVjG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 17:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgFDVjG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 17:39:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287D5C08C5C1
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 14:39:06 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d10so4115035pgn.4
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GxmJqfLXObgDK+KB4PktwKQFJAVJiTIxba9sH+6Najs=;
        b=IL8PqzrsuWRpBzyTHT6o67zwSfyJJ6H/YAm4mMD8v7ox1q08sv6wEjeO8FYLb+b+u5
         T4TxLa3f+a7JsAat6XVteKXKr50/vz9U4bbt2xSwSoxPwJWsrOWNwCr12xX1XiqWyjlD
         ifUVNqz6+Xm3SeIrbKJESfeN0Va5dTiUHsfug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GxmJqfLXObgDK+KB4PktwKQFJAVJiTIxba9sH+6Najs=;
        b=V56W42LWuXYY+2HjDljzl16Ze7v52Iej+M7otIqLOYrC0Dz9BY2uRcjXFxzLbCAD5U
         UEaciMMsu1WN6qVCRfhQ42TxsehfKrpqLN7j+ykXNB8xU1A4xcMc/GsVQK3JoLEQuHsg
         u2LLJykQR3OEi+rIJfakq9+JLh7TVHsa9t901QBvK5IKWvLt7ImPwKVXpdSvw2tIpm7D
         WZpRm/k9AWkBpb4+RvIXq+BrHP2H+WnKW/uiP2VAgWoM+adcUGxHDhU2oA/fKC+2yjIc
         EmhyhdM1OlVi+miOSP4KcCB/It5JZHGs8YHvkSryoAzbL1eip/FDdOW2MRWzdp4WycW5
         jOmA==
X-Gm-Message-State: AOAM532/TC50uMjjIPk74zk8+yz7HrUJu0/pvUFV2rsYIOuh/DqSt8nf
        VBMY2cLFpMZIMgbGH1Oiqc+Khw==
X-Google-Smtp-Source: ABdhPJwqmO+s5Ayfmro9mp6aw3eLObX16a9Bk2z2nYF2A6vjUV7vUQolmxGSqZ4qFoJVLF9U3yhHpg==
X-Received: by 2002:a62:1d89:: with SMTP id d131mr6161118pfd.294.1591306745710;
        Thu, 04 Jun 2020 14:39:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 19sm5928280pjl.52.2020.06.04.14.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 14:39:04 -0700 (PDT)
Date:   Thu, 4 Jun 2020 14:39:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org
Subject: Re: [PATCH 0/5] Improvements of the stackleak gcc plugin
Message-ID: <202006041437.F63645F390@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604134957.505389-1-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 04, 2020 at 04:49:52PM +0300, Alexander Popov wrote:
> In this patch series I collected various improvements of the stackleak
> gcc plugin.

Great; thank you! I'll take a closer look at this shortly!

-- 
Kees Cook
