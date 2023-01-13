Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C7366A6D4
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Jan 2023 00:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjAMXP7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Jan 2023 18:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjAMXP3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jan 2023 18:15:29 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E11777F2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jan 2023 15:15:23 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so25857857pjj.4
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jan 2023 15:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMiMCJTb5LFuwR4bml+l69hnYQL1G+akTSIgXjV1vXs=;
        b=X4KHjEhczDirMTjK/fziTxAevbXGGw7rq9kx81W2fTPIvGLoGCfwSt2nBrHlVe2W8G
         Q76Va6blny+IfEe2b39IPgaNPxMmK+0Vr4hzPMoiCnrLxsyIWeVp8LDSNcUPDE4xrgVR
         u4JyKKHzeF1QdYduZFXFEBBzXpOAzhL+bnVzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMiMCJTb5LFuwR4bml+l69hnYQL1G+akTSIgXjV1vXs=;
        b=U62gaY5zEhvMLN86Cmne9Abn9bUeAwRZSunnC7HHd+1jtn4irGSM66BRdImawPh4HU
         1nUAzvcs8zsPDnig+ivyWPFuBG2W7crWIob6oLTfIMpIrD6qZGFO+X4ibqWWJfa6yIty
         O4ei9Jy4maP9WgZMw4Q/Us1MhUdJthjkBsZp7cED7sw3C96Yp2xqoD14OcnzqkcsWSKR
         Hqns8As+7pb6BLTw2tuWVPqIYdbpDeywrGt+Kwy3cnDfZF3f00je7m79539jswloleUU
         3yLTby4BhDPp59Zm7oFapFGhMGXonjOd+GOv8lC+KGbppMj6mWq9stqu2GDla4wk3YQO
         lAjQ==
X-Gm-Message-State: AFqh2kqauvaqWXrnQ0HLjzsBVWKrupquxuN4ZKL901T7xOtcVrPBjI21
        GT0k733UIpR9pOB7sSsGd8Q8zg==
X-Google-Smtp-Source: AMrXdXsWranqUsDdC6q52vgB5+sRwTueXpbwliTJq7AwCJ5IYX1byQz9BWxPmZN5AsX25qyHE/XO8g==
X-Received: by 2002:a17:90b:3d8e:b0:228:f3fd:a0e2 with SMTP id pq14-20020a17090b3d8e00b00228f3fda0e2mr9863452pjb.13.1673651722785;
        Fri, 13 Jan 2023 15:15:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h7-20020a17090a9c0700b00219cf5c3829sm12902587pjp.57.2023.01.13.15.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 15:15:22 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     masahiroy@kernel.org, peterz@infradead.org, samitolvanen@google.com
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
        nathan@kernel.org, ndesaulniers@google.com
Subject: Re: [PATCH 0/1] Fix CFI hash randomization with KASAN
Date:   Fri, 13 Jan 2023 15:15:18 -0800
Message-Id: <167365171646.590452.12835527795605016769.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112224948.1479453-1-samitolvanen@google.com>
References: <20230112224948.1479453-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 12 Jan 2023 22:49:47 +0000, Sami Tolvanen wrote:
> Peter, Masahiro,
> 
> I noticed that KASAN+CFI fails to boot on x86_64 without
> cfi=norand. The randomization code is missing a couple of KASAN
> constructors in object files that are not part of vmlinux.o. This
> happens because we don't run objtool for the files, which means
> the type hashes are not included in the .cfi_sites section.
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/1] kbuild: Fix CFI hash randomization with KASAN
      https://git.kernel.org/kees/c/a6c5a3491b3f

-- 
Kees Cook

