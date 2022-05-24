Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C47B532D66
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 May 2022 17:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238822AbiEXP1i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 May 2022 11:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238718AbiEXP1g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 May 2022 11:27:36 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7F95F8F6
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 08:27:34 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o13-20020a17090a9f8d00b001df3fc52ea7so2404048pjp.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXnrulZo1r5kA0HgEtcuN32mxZM7voAvx6bVmM5GKlg=;
        b=amf1ud7Ta+hHaU0Tlx0olptOOlJOymbQBxws7nnpHfk/HU0cXR6uqD+kg4FNeYCnvv
         WVOVE3zko9ggmKB46nEg2UFWXQFrUOmc0LTg/GQZMX33mQC6YXci+6DdCHNQrWyje7TI
         0lKHPoAzSG6YDJbeS/kGQr0MBXA4iaAJ0R1EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXnrulZo1r5kA0HgEtcuN32mxZM7voAvx6bVmM5GKlg=;
        b=5A6/unV2IprehIKLX7iTUJ1E7GEVWtQ0+c7Uj8spReBghDKhcJCWNx6+imH9rPPEWB
         LygkOFMGDvlTD/dzQ8CNv3HLKLw7NZqDK5s2aOrmJHR6LYcG9lhVkpNSYcRGpWwMC4ex
         gdg8xNRVmTJPESNr509Z/Eb0VLE712HRwgqZnM2pcE2MetqiJxgPdtyRRRYWOxXRhi0c
         8xjxVWRSgFomgCY50nOCs92BIdB5F7NMIhYFkAsuX6NDqU8tCQkmKv9aY2WCjTpG8eGe
         Zaj5tn3fIpbRWkXycTcF4tg5BWz/jDQiSRr5OulSDl2BAHZioAEvnYkVRjQnFpz2pcqD
         /VlA==
X-Gm-Message-State: AOAM530M//M9yX/F7WYmFTbX8FxgTOuv2lht+MSJ3HRqmqKJ0aUT4E4E
        OTBV3EJzWC+Of7URRuUxLw39cw==
X-Google-Smtp-Source: ABdhPJySPr9vD6XPn6xRLzunOe4QGJl+qBkox+6/WJFeyv9JqG1tatzea641LmZ0gsenOZYy4WQepg==
X-Received: by 2002:a17:90b:1b42:b0:1df:f6bb:aa2b with SMTP id nv2-20020a17090b1b4200b001dff6bbaa2bmr5187508pjb.99.1653406054274;
        Tue, 24 May 2022 08:27:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b0015e8d4eb216sm7543425plk.96.2022.05.24.08.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 08:27:33 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux@roeck-us.net, masahiroy@kernel.org,
        linux-hardening@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, lkp@intel.com,
        linux-kbuild@vger.kernel.org, ndesaulniers@google.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gcc-plugins: use KERNELVERSION for plugin version
Date:   Tue, 24 May 2022 08:26:55 -0700
Message-Id: <165340601337.1531311.10949376876252513636.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524135541.1453693-1-masahiroy@kernel.org>
References: <20220524135541.1453693-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 24 May 2022 22:55:41 +0900, Masahiro Yamada wrote:
> Commit 61f60bac8c05 ("gcc-plugins: Change all version strings match
> kernel") broke parallel builds.
> 
> Instead of adding the dependency between GCC plugins and utsrelease.h,
> let's use KERNELVERSION, which does not require any build artifact.
> 
> Another reason why I want to avoid utsrelease.h is because it depends
> on CONFIG_LOCALVERSION(_AUTO) and localversion* files.
> 
> [...]

Ah, perfect; I appreciate the better solution! Applied to
for-next/hardening, thanks!

[1/1] gcc-plugins: use KERNELVERSION for plugin version
      https://git.kernel.org/kees/c/d37aa2efc89b

-- 
Kees Cook

