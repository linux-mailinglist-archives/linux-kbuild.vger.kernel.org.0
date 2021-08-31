Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DC83FCC6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240445AbhHaRk3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237342AbhHaRk2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:40:28 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64707C061575
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:39:33 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 7so15551763pfl.10
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xDeVBbgeexHtF3xZTr/Z5XIJvoWPGg8TgtAVTs7pccY=;
        b=YHzAOwQ7W5sE8oy1C1Bv0sU1fcmcjthdcaOXgAVeRbO+Z4Jw0C2JRuQvs9X3gM5rJ+
         VBTU6jXx+bbp6e8oJU/khMEAJiLY3yLmMdJP5GhBxLo1ICoiDBRpnbH6CqWiaQVkUE4Z
         iCiziBwV7zdkD3BtR8aanveIvkfYUgvToW0sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xDeVBbgeexHtF3xZTr/Z5XIJvoWPGg8TgtAVTs7pccY=;
        b=fFkrXpXGY4CDE997kGL6x9YbZPEtAWriLTnxA9FgJihPeZYlKUzuF/fj1042lZEhUM
         5TgxeosLOvnZ58d+k3JZWt30wToW8tWgxnjNCbgr389Hoy67JuUiwEIo1Z0aXEoPrGIX
         bPIJqVybVRT9pnPjW6AEFrVl4yUTTB/F5nmM9/HyAujY/C40bchkwGgJBgTNq40+muCU
         uNSfA3wmhGow8+i8H7B3us9GiwHjp63hZPsbYdL47GTmhwqp8g6XkfgNYdc75J75mVUJ
         Iyvubo2C6Hhv56OQZEzVedG3CzJ0vPPp78i9ebJHvr9lNYCEjEKZ72fSa7QhgLZBSUK6
         A4iA==
X-Gm-Message-State: AOAM5334p9IgsFWgsjYxM1hSQGE+eh6i9yJARhE35+tq6P4vGSnRzAbC
        jUEMkSfwvGm1S3xjHAuYJ6CknCNGdaidAQ==
X-Google-Smtp-Source: ABdhPJxFnhPHkzJxhAYxSN4j2KI6SJiNmz5C+/dR05pY2T77QCKvaS/+uyeJy+Hlu9zPujtu8Z1oRg==
X-Received: by 2002:a62:cd0c:0:b0:405:11d3:a13e with SMTP id o12-20020a62cd0c000000b0040511d3a13emr4733820pfg.41.1630431572932;
        Tue, 31 Aug 2021 10:39:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i5sm14636657pgp.53.2021.08.31.10.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:39:32 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:39:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] kbuild: add cmd_and_savecmd macro
Message-ID: <202108311039.57457A4A@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-10-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-10-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:40:00PM +0900, Masahiro Yamada wrote:
> Separate out the command execution part of if_changed, as we did
> for if_changed_dep.
> 
> This allows us to reuse it in if_changed_rule.
> 
>   define rule_foo
>           $(call cmd_and_savecmd,foo)
>           $(call cmd,bar)
>   endef
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
