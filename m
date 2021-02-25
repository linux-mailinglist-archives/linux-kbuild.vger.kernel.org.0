Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BC03257D8
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Feb 2021 21:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhBYUjV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Feb 2021 15:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbhBYUiu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 15:38:50 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA18C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2021 12:38:10 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k22so3853598pll.6
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2021 12:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zptqJTe4Lhvj0ISv5r6VCwvSO5K2A0FLooffN2eyIAY=;
        b=EpipaUPYdym8VBXhPImPfahmSNFaMJHLQCCMbhtfIXG/g+BpqTUJ8AphB82z/pJMYJ
         xPDS5G46lcbPmlDcW4ht7YfY726GZaedqmRfxBmMrZM96O0ZrJEZscCpJ/H503VMp9Bx
         MydPKb4JuCbr10eEaJDfwrWhBCtHLTg6YqRYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zptqJTe4Lhvj0ISv5r6VCwvSO5K2A0FLooffN2eyIAY=;
        b=QVBUduJymw72+RALaDHAuVpJxb4Yw6AvYChhtpdTZy44WJVrM3v6NF5ST8GqvmIQbW
         5kMkEsK/d/ae8vxbUoqbgC7qfkAhcz+WTMoH44OIbfD8BLP6+FSr16dhKDOv37LE1dfM
         RF67OvmLrpUQWmyEfMjN2KvxpgJwD0UFzFKKEP8Mr9ZBijl+bLdHzNd2cXxWVkFoiF1q
         yIYh6Lo/BG86YvBb6e9X5IfsSKtgt9L6KNPvYiL1ywjPjO/4mRNfwn2FCFIVQBhpRmfC
         rEB1uBa4uzipYoEU1FIP8Z1MC9c2rJ9/xDg2gBPST3jsCRh1jJazH4IrRmOSQzJGkTM4
         9g7g==
X-Gm-Message-State: AOAM5311PvP5j6FshvtuZOqogPm4w01RVv5udO/QFonDe7Ll/UTAoTzG
        YFuWK9np9p8VfY4sw/YAHJNj0w==
X-Google-Smtp-Source: ABdhPJxUtGHsn1V2lUBCDODlS73YnOm4g1P+zr/R4bf1PYGCSXxfYSoWh3rWcCZC3ZW103Dbae3xng==
X-Received: by 2002:a17:903:1c2:b029:de:ad0a:2dbf with SMTP id e2-20020a17090301c2b02900dead0a2dbfmr4751100plh.44.1614285490419;
        Thu, 25 Feb 2021 12:38:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d75sm4645631pfd.20.2021.02.25.12.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 12:38:09 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH] kbuild: remove .thinlto-cache by 'make clean'
Date:   Thu, 25 Feb 2021 12:37:39 -0800
Message-Id: <161428545419.1995074.7779393210458709267.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225193912.3303604-1-masahiroy@kernel.org>
References: <20210225193912.3303604-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 26 Feb 2021 04:39:12 +0900, Masahiro Yamada wrote:
> 'make clean' should remove build artifacts unneeded by external module
> builds. Obviously, you do not need to keep this directory.

Applied to kspp/clang-lto, thanks!

[1/1] kbuild: Move .thinlto-cache removal to 'make clean'
      https://git.kernel.org/kees/c/4c7858b9001c

-- 
Kees Cook

