Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835663FCE48
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 22:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbhHaUTo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 16:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbhHaUTo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 16:19:44 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EBFC06179A
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 13:18:46 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id v123so237625pfb.11
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r9GlhdKOosTzO8LRW6O4s9OUHVsB4FP+bxUhxdd1GR0=;
        b=aC14HTofppYVFRnQldibqoCSawNZyB3QTtPZsQ5Xl2i/syvuj8VfSSNcb7EJP3CXRx
         OWe5enRZUx9hRSbnxOUDwbKWt8w41283gOFBdZR8lZjPp/eh622bK2yTcNMuhLmnl9iH
         H6eQlQOAb54RKUtP5lPFn0G3Pa04FZSehFVA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r9GlhdKOosTzO8LRW6O4s9OUHVsB4FP+bxUhxdd1GR0=;
        b=KQT+ZV/SYqYaeOU6oHR/N0HxV+04Miw0KqKX54S1KsMJcaPEZw9I1jLlyFReHTtrGb
         txgKYLxQRPl5DCXcNSe5eaTTb7WCurHzFS/1WzMPSSLBP3VP96wI88x5PkSgzGQUf9V5
         E/BDh6rvAs9tuhJ+Sa8GLWOfTXFuGoD9THCrA0UBLQv2cmooDpQtt0oH+MgL2TKacFnH
         jV4bjxRmeQAG0HF5IGviR4YOtwDoKbeET6Uvw6KvFFdscW/OWTWwVEwGosVphyIO3gdl
         WJVs9BBVykcdh3QZPzt1fr2ZKK4MgDNEa+7PUntPHzkcaEKB0C5cSow49uamtBmXQt+1
         Reaw==
X-Gm-Message-State: AOAM531X6/E7ViJSrd1SarIydv/q36Ov7FwpKU7rhxSZPlA5CYAceSe3
        1X3SN8oeqoPz3NWRRsBegqctUQ==
X-Google-Smtp-Source: ABdhPJxUlk5jlKKeD4jMzypYtqK2meJMhtPOJBqKR+4e1VA7wvJwaaCFKtaKWS7ohBKeuH3xgQxHZA==
X-Received: by 2002:a62:ab04:0:b0:405:c1c0:543c with SMTP id p4-20020a62ab04000000b00405c1c0543cmr4085848pff.36.1630441126251;
        Tue, 31 Aug 2021 13:18:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d7sm22416029pgu.78.2021.08.31.13.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:18:45 -0700 (PDT)
Date:   Tue, 31 Aug 2021 13:18:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Keith Packard <keithp@keithp.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 4/5] Makefile: Enable -Warray-bounds
Message-ID: <202108311317.DFFFCFC74@keescook>
References: <20210827163015.3141722-1-keescook@chromium.org>
 <20210827163015.3141722-5-keescook@chromium.org>
 <20210831043128.GA2749311@roeck-us.net>
 <202108311042.FFE1818D@keescook>
 <3ab153ec-2798-da4c-f7b1-81b0ac8b0c5b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ab153ec-2798-da4c-f7b1-81b0ac8b0c5b@roeck-us.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 12:40:53PM -0700, Guenter Roeck wrote:
> The configuration doesn't matter; it fails for me for all configurations,
> including defconfig, alllnoconfig, and allmodconfig.
> Key is to use gcc 11.2. The image builds just fine with gcc 9.4 and 10.3.

Ah! Yes, heh. That would be my problem; I've got 10.3 for my builders.
Thanks! I will give 11.2 a spin.

-- 
Kees Cook
