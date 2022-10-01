Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEBA5F1CF2
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Oct 2022 16:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiJAOsq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Oct 2022 10:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiJAOsp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Oct 2022 10:48:45 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDE676741
        for <linux-kbuild@vger.kernel.org>; Sat,  1 Oct 2022 07:48:44 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id h8-20020a17090a054800b00205ccbae31eso11614036pjf.5
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Oct 2022 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WXUW6n+YocspZHBa1uHAP+hmukxgAOqdWaMPFjgZfq0=;
        b=oQrIcLm2/AzOeI7DlA81NFJX3B3BOsT+QRzwk3H2jTaTTc0+eHKpvnX2twWCBiSkJV
         lCl7IMk+VpTcE67HGBRnpdj5AIo2AfprWmaW5ZzSnjWBd/jmIIJy25vQd2Reec9WinPH
         l27pxL9fsGWW2OiZd6AEjAlJQ8twp/pbDh14U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WXUW6n+YocspZHBa1uHAP+hmukxgAOqdWaMPFjgZfq0=;
        b=lXqeh4kSO4ndaClaXY8Hxe58TJ1FKawWgk2acgn21MES6rDEgVBSueMEiCGDQKYwOV
         dWynkDBcshR2HMEtZ6h+QVatrQnlr85isrVELpQFzxoLDMPcitGxQosyqNQu3XDhrwO/
         6vPBu4kHZdlLqoXBde6qS9lFkscMrldtBpGsJdtetVectGXa3narVnSpkNUb2dToQV/Y
         CphgE122yZI0gvKD99jpTDIdee1MaSfGznR1jcZ9cgRvNz3GQiXlNAkA6INC3eafRySY
         scatV58fMIFVRnOBUZ2mK6Asx8k7lz07ZSrwsoBSl+Cr6/Uzm2qJ0BQ6ADMt6mZkBSS4
         d9ag==
X-Gm-Message-State: ACrzQf2i1hGuDJn/J0YjBr5fzVmGbXkhppMl+oHmvnXllR/hfovvZkZk
        Ck48TaGzSKPFfs7/n6twvM5H9g==
X-Google-Smtp-Source: AMsMyM7OFcoeT8Wign6R573YRonn6hDxkXDAJo6yXcperZ70XVD7CulLRtdLOLh3tmxu8dyxA/PQXA==
X-Received: by 2002:a17:902:d54e:b0:178:2da7:1bea with SMTP id z14-20020a170902d54e00b001782da71beamr14035113plf.161.1664635723987;
        Sat, 01 Oct 2022 07:48:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x6-20020a63f706000000b00429c5270710sm3532975pgh.1.2022.10.01.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 07:48:43 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     samitolvanen@google.com, masahiroy@kernel.org,
        michal.lkml@markovi.net
Cc:     Kees Cook <keescook@chromium.org>, trix@redhat.com,
        llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
Date:   Sat,  1 Oct 2022 07:48:25 -0700
Message-Id: <166463570274.4070760.11444179166073924518.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930203310.4010564-1-samitolvanen@google.com>
References: <20220930203310.4010564-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 30 Sep 2022 20:33:10 +0000, Sami Tolvanen wrote:
> We enable -Wcast-function-type globally in the kernel to warn about
> mismatching types in function pointer casts. Compilers currently
> warn only about ABI incompability with this flag, but Clang 16 will
> enable a stricter version of the check by default that checks for an
> exact type match. This will be very noisy in the kernel, so disable
> -Wcast-function-type-strict without W=1 until the new warnings have
> been addressed.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
      https://git.kernel.org/kees/c/2120635108b3

-- 
Kees Cook

