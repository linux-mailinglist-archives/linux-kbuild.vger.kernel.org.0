Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409BF70716A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 21:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjEQTCd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 15:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjEQTCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 15:02:32 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C70A83FD
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:02:31 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6434e263962so895057b3a.2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684350151; x=1686942151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cQTCNheYZl+3yNBMCx3sHGYTeFIvig1PSLkqmRnl24=;
        b=c4/xIh+TlUQipA53k5weP//Y9ntGrUcZcfCaC+Ro3CgAcfELru1Fwua2gzPbAkTxBJ
         nJorT+TlzvlTJgfhob/eVzwHf/+d4pEhgSfC8n0AozlqfZY7nYbsoc6CK9P+UzlhNQfq
         9l7QcA3K8bd9/EbKP8kNalAroP5gS6/wxxs8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350151; x=1686942151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cQTCNheYZl+3yNBMCx3sHGYTeFIvig1PSLkqmRnl24=;
        b=aoAoLj24yVSdTK84ywwzXALLgvtrbGw02tgKC+lrYLuXD3fLtkVhmdUGE/oLqNQgKn
         bRx34/bm7jLH7TtqfohByafwultp9XPOzgKzx3u9RECU4Fa3vOo2yw0VUowHarkSXfdA
         Wy8WJpvmiwM29rTzIx8t8MMXYLdZ/OiNrLYTXcjITEUGu9Kt6v6KWLUEFLr5ukt4Vu1s
         GBJxgAxv5di4OcRNJhDICmTgreEszoWCdFJoIjiQ1A0Zu3DI64E6XvVbf6oTCSsNuwVW
         Hmd7mohzTES4peRUlpiqYsFh5q8kGLbyC7wscqMYhdvAwi1TKbLKEhGERlnj/5+Ya+Yo
         HRXQ==
X-Gm-Message-State: AC+VfDx/ahdG+R0tHqrurCfOSQe6UWHsyadAjNmzSX964+nOS2aRyvp3
        7F/p5L3vDEsPjA75YvNLFETPnA==
X-Google-Smtp-Source: ACHHUZ5AQB3xPNC8HeE5B7ZSnQJ2q0B1Dhpm7pti083TO4i4yE+YkV+L4SebHFCZSa52EeGOU/k4+w==
X-Received: by 2002:a05:6a20:4389:b0:105:6e1d:5605 with SMTP id i9-20020a056a20438900b001056e1d5605mr15348701pzl.62.1684350151063;
        Wed, 17 May 2023 12:02:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm15521703pfk.158.2023.05.17.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 12:02:30 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     ndesaulniers@google.com, masahiroy@kernel.org
Cc:     Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
        nathan@kernel.org, linux-hardening@vger.kernel.org,
        jpoimboe@kernel.org, llvm@lists.linux.dev, mbenes@suse.cz,
        linux-kernel@vger.kernel.org, trix@redhat.com, peterz@infradead.org
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
Date:   Wed, 17 May 2023 12:02:25 -0700
Message-Id: <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407215406.768464-1-ndesaulniers@google.com>
References: <20230407215406.768464-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> Clang 3.2.  The minimum supported version of these according to
> Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> this cc-option check.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] ubsan: remove cc-option test for UBSAN_TRAP
      https://git.kernel.org/kees/c/08e4044243a6

-- 
Kees Cook

