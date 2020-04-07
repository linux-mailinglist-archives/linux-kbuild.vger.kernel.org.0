Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 014F11A1534
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 20:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgDGSph (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 14:45:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33294 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgDGSph (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 14:45:37 -0400
Received: by mail-ot1-f67.google.com with SMTP id 22so4263601otf.0;
        Tue, 07 Apr 2020 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gIwQXo30ZMAIkBOcVj8rGDbZtlax11guTXEso2ZEUsc=;
        b=RA82pSey4Yv0H/tle8kDxmXR1Vov50OhJn5NRQbpbw1I67v8xkwHPthpd4V10HbztQ
         Aw19NCLdMMIXdPYAThrTk+yRNTAt8tBNO8kYsYk19mqNveMh/U/ELa2zRJjehtIidXcw
         jPN1t1Gc6kz7F8T6uDLTKdf4zrQLCJ3sqeWWyN0vbZGaJWDRn4W5eyE5Ezbn9fXQQ3Gm
         TnbsV7wdykH4lXmT23nNjX1ymuHgmO2gQwEy8pPCw9hhnuCWFAKx6QxJG2O/Kb9Ce2J/
         JceREjngPoabEWKMFQyPw0yHzC7iiLNox76+9P26cZsrAwgls69319SRaxyRW2hL2JYH
         qU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gIwQXo30ZMAIkBOcVj8rGDbZtlax11guTXEso2ZEUsc=;
        b=SlGlQ+7YnCP73POLQhgoZPGJAlk01gOqxeV58LrnhnZKxSdwfo0I4zX31NyFkSr+bn
         AjdjodhS02h+3/kCvgXlILu2eGP5SdPe9sTi19X3ykEloKRzsReuni38fIFCdaEF/UHh
         /E2hSwL1+UnEl4cA8WPZSCEPVYPLpA+ZmvGdBk+h+zOXDixMuafG4KFjpmX7xxD1eMbh
         hjzC8BV0yLJC4y6gdtcoa5Z1h0WmBvdYQEYZT3VoeBE9/6+Y68llQA9c+x0Z00ufxoFn
         BqnYfiUn1vB1vPVdVI+LrNAoqym8/5raohDv5DVD/0Gq7/KoMUGoNc/RK+X6kUUacbj/
         urww==
X-Gm-Message-State: AGi0PuaQLDpoO0W8Pa0D0xQGY3tOZ5HAAxOThvzG3fTT4c8v9rYNOAMZ
        w09hOdUuYWP6ylR7WStBWag=
X-Google-Smtp-Source: APiQypJdxahdG65tvuwC7Cm01mkk7QWp7VED5VN28r2S+3MBIbGJmdDYHkwOCW+U36ThYHo/KTaj1g==
X-Received: by 2002:a05:6830:1348:: with SMTP id r8mr2688095otq.57.1586285135559;
        Tue, 07 Apr 2020 11:45:35 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id k132sm5609593oih.9.2020.04.07.11.45.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 11:45:35 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:45:33 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] kbuild: replace AS=clang with LLVM_IA=1
Message-ID: <20200407184533.GA48427@ubuntu-s3-xlarge-x86>
References: <20200407184336.14612-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407184336.14612-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 08, 2020 at 03:43:35AM +0900, Masahiro Yamada wrote:
> The 'AS' variable is unused for building the kernel. Only the remaining
> usage is to turn on the integrated assembler. A boolean flag is a better
> fit for this purpose.
> 
> AS=clang was added for experts. So, I replaced it with LLVM_IA=1,
> breaking the backward compatibility.
> 
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
