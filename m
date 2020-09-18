Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C27D270833
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 23:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIRV1h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 17:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgIRV1h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 17:27:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6FEC0613D0
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 14:27:37 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f1so3630807plo.13
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oyniRHLrev38PACfE6ROOUQ+EtF7xvXESn3D/FnfQhc=;
        b=Gd/q8cwdBNkyNhv65cXruSk7HmCBZyI0NM7/ouCTg5QPQHOOZqp4RghCLzMgzPGftR
         JznBjuFSKtHMubNl4QKBoWync+IMmD9ROTiROxQcWGORDHNeeJVuAmzGTG0krZ6EZ2uK
         mjIm+rW2vxoQGJLpOdD9TRJhgE5O7gUyhRSpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oyniRHLrev38PACfE6ROOUQ+EtF7xvXESn3D/FnfQhc=;
        b=pGNkG74gDbHzDVFe4tT80LYgUN91W67RRjBMesxizL1uy8nK0VSH03aE01KHCamX3o
         meQHBNmosZ9YEul+86YSvnAYiasPDe5qzUirJnuB1IzlA9bkssOcbKk1FtS+vcA6wiqo
         LFNNiilNv3lWb3rRYxeAz2cLZ60UsxtL62Ct6BceTEKawv8Ve17R0oeWeq7u7ir5M0gU
         Kigf2+8RmTsXeff7SxuyHSyh+/VCXhJ6qCp20GiwX5y/JPDRyqU0Kg4D+mW+l2VGbiOl
         ANupEAmfgoipbU2Ubontl94wn48xqyNvheBjeEdGtXozVYVd6kWshYlbFMFgViquQC0t
         hD8A==
X-Gm-Message-State: AOAM530Iul/Iljs0G+Ys3eV1yugV6EN0yAqqkfMySrB6aM1p2yv3xRci
        KVol1OW992+YphARPQAWSvIIgA==
X-Google-Smtp-Source: ABdhPJwQRHrvTU2iqmtduKsBEnDA5AQ9wnRrMouN20yhgYE7G4D0CEMvV1m3BHMubfbdZMtqWREQzQ==
X-Received: by 2002:a17:90b:50e:: with SMTP id r14mr14380487pjz.230.1600464457018;
        Fri, 18 Sep 2020 14:27:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i17sm4098269pfa.29.2020.09.18.14.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 14:27:35 -0700 (PDT)
Date:   Fri, 18 Sep 2020 14:27:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v3 13/30] kbuild: lto: postpone objtool
Message-ID: <202009181427.86DE61B@keescook>
References: <20200918201436.2932360-1-samitolvanen@google.com>
 <20200918201436.2932360-14-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918201436.2932360-14-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 18, 2020 at 01:14:19PM -0700, Sami Tolvanen wrote:
> With LTO, LLVM bitcode won't be compiled into native code until
> modpost_link, or modfinal for modules. This change postpones calls
> to objtool until after these steps, and moves objtool_args to
> Makefile.lib, so the arguments can be reused in Makefile.modfinal.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Thanks for reorganizing this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
