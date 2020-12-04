Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD7E2CF7B0
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Dec 2020 00:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgLDXrX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 18:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbgLDXrX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 18:47:23 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7F5C061A53
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Dec 2020 15:46:43 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b10so4854668pfo.4
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Dec 2020 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LGD/RRlJ9qYcjJKn7WhBQr/iddBUcMbCKVBFUtvDryw=;
        b=W8nYbzW29aK5BI9b3s/HSOzJYye5fofwtRGf/n08NAYFqTAnms5MDGLkVxvQuvia7+
         8lYvKlc7hfU3yjVEqUwwHVXeutiagN4yzJLeVYiNWpjJHD0a/Nl9HfaHBtd3nxPp2lve
         mQVzqhP3egC18W9DwiyAoc7E6BOq0rAXrJ0ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LGD/RRlJ9qYcjJKn7WhBQr/iddBUcMbCKVBFUtvDryw=;
        b=gBhLDm1Mgu5ND+5UvJz2TXQHXChygrBUaire37c7QfmN1GxF+A3Gy3x8Ec5eocSFBR
         Mc2VUWNFMc1rNXxqlLA4PwYIkEdOfhGwk2hKCi+OJneKnF3XwR2xrkYOx32BZJonjpRr
         YIt+GB4+YlImDCWSTiK7b1CsG7stEjBgFcH+IMP3h4SR8x79REYGbNR0if02pWuVF3c8
         avAAsfwIk7NL5RaJoUWwEf1sd5bssctYpbhtrlx4cpMeUvNdc75wc7ElKBheUMX52sow
         +xigH8U6e5K+126kjToJfaYnSwoE4+rZZMAWX6cHBM6KHyyVloFioTQauCmt/xgNZxSt
         yv5w==
X-Gm-Message-State: AOAM530xfK/v60xO3tCEsox8AzL0rgV/SVrIin/yTGQpYTIHK4/x0Oph
        6HFKk39EBtVnHCQSr1V+RkZ/mg==
X-Google-Smtp-Source: ABdhPJxst/88x4vpS1tQ3o1+yZeDoCO32pjKEs+qGoYQW6uKQW2SDAJq6pQ3PklTgGowiEbbpxN2MQ==
X-Received: by 2002:aa7:8090:0:b029:198:39d9:23e6 with SMTP id v16-20020aa780900000b029019839d923e6mr5896075pff.45.1607125602602;
        Fri, 04 Dec 2020 15:46:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q6sm5732915pfu.23.2020.12.04.15.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 15:46:41 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kbuild@vger.kernel.org, Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
Date:   Fri,  4 Dec 2020 15:46:29 -0800
Message-Id: <160712557572.2401125.2412248759980660312.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203125700.161354-1-masahiroy@kernel.org>
References: <20201203125700.161354-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 3 Dec 2020 21:57:00 +0900, Masahiro Yamada wrote:
> Linus pointed out a third of the time in the Kconfig parse stage comes
> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
> and directly testing plugin-version.h for existence cuts down the
> overhead a lot. [2]
> 
> This commit takes one step further to kill the build test entirely.
> 
> [...]

Applied to for-next/gcc-plugins, thanks!

[1/1] gcc-plugins: simplify GCC plugin-dev capability test
      https://git.kernel.org/kees/c/1e860048c53e

-- 
Kees Cook

