Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741BF2D6C9A
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 01:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404011AbgLKAaQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Dec 2020 19:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730504AbgLKAaG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Dec 2020 19:30:06 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349A0C0613CF;
        Thu, 10 Dec 2020 16:29:14 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id b9so5288183qtr.2;
        Thu, 10 Dec 2020 16:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rmf7XBQbFrTt9I7PMZkiNuKnWeN4JeUQNc3H8Tyzf/U=;
        b=JS2eCDheJmAIEiKWoMPrlBYMlF4uI6GfILrKJhp5qEkVz7WR8fk9fDCcD66wJbwEho
         dSn8vCEzr59Ks/qKJZrMsYK38ZLe8wLeP5+PtzuBKPZ5YQCc35ZoIpDvX5xx38wx4CJw
         LvGc8ovG1GDmjthfRFCavlMMbxE/Wm3Etx6N/nYgmW9JEaPC6Lm6pcBcCjWIPpPqVFZx
         pX/DZQf3NuIbGRzTrC9G5gM3qPBGwaDzCMwQwwt6J3/0Bj7IaQ1lRNbndxpqm95j2hQH
         DZEJFFormfcKujczKC4B/0J5krQmSULUMHAeE6NJooB5ApUdgU6ZEHg18JNt6hOF1mXu
         tJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Rmf7XBQbFrTt9I7PMZkiNuKnWeN4JeUQNc3H8Tyzf/U=;
        b=XOybh65Wb3C2ybWIcTWvkLUs+gAM0tOPbp/pdz8oNlrSgiYBR34zHD80/fouAmQrLv
         CMLNN75Nc9KaJ4OzznotzJ12+KyvOp9aAYMEPr5/+5YhtMUWwJRXUOAb2WE9wvQiB0hS
         aT4QZkUrIOxwN699TZRNezM4DrnPZIpTylGPcvG1HuwinWTfmsia5CZ3GDwEbSMX9eyf
         S6bxGhCmKwfRqFI3J/KPt32mr0P1ItN6D1F15SblKlog+kD/c64r4JJDaEMqM+YboSnU
         8sR40dmd+hPppUmXsE+Tg6kZod+AfCHyy0inxR8Bv0WOilNPOlBSC3UXPjLUKT2T+HNE
         Pwbw==
X-Gm-Message-State: AOAM530IKRq5eFA4buM8l6eUPsNBXKKnNyAjvS0RumS3VlMI2lKl/iBW
        F98FdEOB0CnTdDw/dwjWuzo=
X-Google-Smtp-Source: ABdhPJxlVnHQcyltUBp1hIXfbZzTL8eN/sJknHOx44slguNjI07wFsWVrcRVE1HLjTDvH4Paonwxjw==
X-Received: by 2002:aed:3025:: with SMTP id 34mr12349937qte.39.1607646553220;
        Thu, 10 Dec 2020 16:29:13 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id 187sm5646082qki.38.2020.12.10.16.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 16:29:12 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Thu, 10 Dec 2020 19:29:10 -0500
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 4/4] Kbuild: implement support for DWARF v5
Message-ID: <X9K9VrHkcgMhG4zc@rani.riverdale.lan>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
 <20201104005343.4192504-5-ndesaulniers@google.com>
 <20201124172836.GA346213@rani.riverdale.lan>
 <CAKwvOdkGvLrPr4pHi4LKCF5t74+wencdy7r38d3k_4pC9pQYwQ@mail.gmail.com>
 <CAKwvOdmEVM67v8PqPWHP-VyGTkQpkWv8FdOTbxQ-7ebvSummMA@mail.gmail.com>
 <X8psgMuL4jMjP/Oy@rani.riverdale.lan>
 <CAKwvOd=SbbJptBbv3y39_ZCeTbO0vb_fa5ZbQQ2LUquegzLycg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOd=SbbJptBbv3y39_ZCeTbO0vb_fa5ZbQQ2LUquegzLycg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 10, 2020 at 03:18:45PM -0800, Nick Desaulniers wrote:
> On Fri, Dec 4, 2020 at 9:06 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > Why? Does this actually cause any problems?
> >
> > It seems like the options for gcc can actually be very straightforward:
> > you just need a cc-option check, and then add -gdwarf-N to both CFLAGS
> > and AFLAGS and you're done.  Adding the -Wa flag is superfluous and
> > carries the risk of interfering with what the compiler driver does. Just
> > let the gcc driver handle the details.
> >
> > Clang/IAS is almost as straightforward, with the only additional edge
> > case being that for assembler files, DWARF 2 doesn't work, so the CFLAGS
> > is the same -gdwarf-N, but AFLAGS gets -gdwarf-N only if N > 2.
> >
> > The messy case is only Clang/IAS=0, which needs to check the support
> > from the external assembler, and needs CFLAGS of -gdwarf-N and AFLAGS of
> > -Wa,--gdwarf-N, because Clang doesn't pass that option on to an external
> > assembler. This is why I was asking if the assembler support check can
> > be restricted to CC_IS_CLANG: nothing but Clang/IAS=0 actually requires
> > that check.
> 
> Oh, I see. Yeah, that might be a nicer approach.  What should we do in
> the case of gcc < 7 though, where -gdwarf-5 won't produce DWARF v5?
> Maybe that's ok, but the intent behind the Kconfig check was to
> prevent the option from being selectable if the tools do not support
> it.  Maybe it's more flexible to pass the arguments along, and hope
> for the best?
> 
> As a gcc-5 user, I might be surprised if I chose
> CONFIG_DEBUG_INFO_DWARF5 if what I got was not actually DWARF v5; it
> does violate the principle of least surprise.  Maybe that doesn't
> matter though?

Even the current gcc documentation still says "DWARF Version 5 is only
experimental".  If the user wants to try it out, I think it's fine to
let them get whatever subset their tool chain produces, as long as it's
not completely broken. Your latest help text does say that gcc 7+ is
required, maybe add another sentence saying that gcc 5+ only has partial
support for some draft DWARF 5 features?

Thanks.
