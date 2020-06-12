Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C1F1F7D71
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2020 21:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgFLTRV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 15:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLTRV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 15:17:21 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BC8C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 12:17:21 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b5so9791968iln.5
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=JHondDNfpfk5aZm0K9J7QXk0cVs6+aeE3fUr/4FaraM=;
        b=AAycemlCGHnrKl7mdmFxiBiQDrdXtID4DISyT0F6Kke1N5wiTDKDs6MFmKeNdo+tgs
         0Gr2o2MppFjoxuPsKUMPu+ThFwo6w8+DlhdeODcd+Kqm3CltJShFGaqyrflqOWJmtynJ
         jPJgZ7mkq7QL+d9Y9K7WipM9FN5Y0+uyNG3sAL9rl67LtkxWN88E80ECn/9YvqdpfbpH
         9nXkx9uTJflse8mwYq6eNPlra/BKFouteHvAHNCMZG7qDwvGRpXlU10gf7+psttuJpWC
         FEpEAemWdzzRrc669mP3JCSR12dQg26rxwp0/ZfuyA7F27oT6TLduhxaXJMbfvpqg/YN
         YE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=JHondDNfpfk5aZm0K9J7QXk0cVs6+aeE3fUr/4FaraM=;
        b=swGeBDFmonlBgVUC7ViyVZ+wDMbyCAkIsHKCTKc1q5Co+uY7ZXQ2k35Fpj4plfr85s
         /P/R/r6AK+XWAjr6TCoV9/mOAQNIVBUWAurvP4FEKAwqNTw7Xj8R6ndTnfVNPMt9e7+f
         yuL6m0+iHEMsTCrnk9X5lu976FNZE1QG2JHCasOvu187W9OkMHwkY9v93OplkXJ+/BZg
         LUIw5QDp+OTR8lqNpO9ACl/qOh1pUQl95vU5o/dcodKrHooPK80iFjDWCz/8PXGvf/fk
         Yy3AdsUfbt6Vosc2Z4cLmhHRQFudIBo6etuK56NrRxhcb6Nm1TGTuKRLF2ouZZnej57S
         vdyA==
X-Gm-Message-State: AOAM530VByum4EeEE4FevoQUAjdL/OHZELF7znJikxPGLjIoOha/exUO
        NBT+8dyvcY/m04Kf+wHaG2zUD0aA88K3uK818jI=
X-Google-Smtp-Source: ABdhPJwescRJKIhxbR+fsF6mxjfdOCmQuVnMpDfFKzoBNenTP3pnw/B/VS7hBXr8XxDdMBvgrEWtT92ZYtyphyt2SDg=
X-Received: by 2002:a92:498d:: with SMTP id k13mr14817770ilg.226.1591989440248;
 Fri, 12 Jun 2020 12:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 12 Jun 2020 21:17:09 +0200
Message-ID: <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com>
Subject: LLVM_IAS=1 and DWARF-4
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

when I build with LLVM_IAS=1 I want to force DWARF-4.

CONFIG_DEBUG_INFO_DWARF4=y sets "DEBUG_CFLAGS += -gdwarf-4".

I tried:

[ Makefile ]

ifdef CONFIG_DEBUG_INFO
ifdef CONFIG_DEBUG_INFO_SPLIT
DEBUG_CFLAGS    += -gsplit-dwarf
else
DEBUG_CFLAGS    += -g
endif
ifndef LLVM_IAS
KBUILD_AFLAGS    += -Wa,-gdwarf-2
endif
endif
ifdef CONFIG_DEBUG_INFO_DWARF4
DEBUG_CFLAGS    += -gdwarf-4
ifdef LLVM_IAS
KBUILD_AFLAGS    += -Wa,-gdwarf-4
endif
endif

If I set LLVM_IAS=1 ---> CONFIG_DEBUG_INFO_DWARF4=y shall be set automatically.

Dunno if "KBUILD_AFLAGS += -Wa,-gdwarf-4" is a good idea.

"KBUILD_AFLAGS += -Wa,-gdwarf-2" is known to break with LLVM_IAS=1.

I am lost in ifdef-eries...

Any cool ideas?

Regards,
- Sedat -
