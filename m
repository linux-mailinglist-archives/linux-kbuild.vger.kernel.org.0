Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B349611C5C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Oct 2022 23:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiJ1VXr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Oct 2022 17:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ1VXq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2022 17:23:46 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6984124B313
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Oct 2022 14:23:43 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f193so5928581pgc.0
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Oct 2022 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs57GpHqiEaUWAQS4x0FdYfIt3gye0GQitfWQ5q7LSI=;
        b=kcZLpIXF7fyFZVyjeIoJRf1KW7qkt5IfCDmxI6FIpKrDmPUchUvFwLlOQ5zCb6wkf2
         yo2eUg6r6UTVSNgetW1t80iijaQWwZ59vCQwutKCCj2wsdZ/ZfGQ5pHbP5Lfr524w9Au
         2xBw0PYyWpCQbgAJWajlZzP+l054n1GdzsBbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs57GpHqiEaUWAQS4x0FdYfIt3gye0GQitfWQ5q7LSI=;
        b=Vkr1z2eG3YnIt5w84suGP/SfnIj00DQGWoPVQGTGJsbI4IuChzAzW/qazMctmLuPv7
         p5tAVejc4bujqO3xjfN2UZpwh4OopwlpxGXT/AAZVMip9a1avI7k5yqO2axUJpb2Rxn5
         Kiq1zXweFYXwL21qzszQzBd/vihK88cIVoEa8bn5yDNFz+wczdmUZa1UCzVuKZAPwNc3
         Fn6ungGh/zrNpXR86UmR1URUTnPT3fIhs/+gleou6UquneJO6VNyJW/NJhbiXyuG48m/
         YMdDP+Qy/zwAfgj7BFGo/Oy07SSdb9G9inIr/ioX7d09yRrqK01oED9JjCgYrgmVJGWG
         R+yQ==
X-Gm-Message-State: ACrzQf1N6g89PGnzSYyPcyY/yuDvlxaKQT5ng7EsKcefYW8m8TtpN5kG
        qN7zgI1zpvOToLjQ1u1cmAJM3w==
X-Google-Smtp-Source: AMsMyM7UcvF2uCV+FwyTaTQtIG+fYtOv+V6Yk6R7YMfAgfg20rw4FNUE8cNCGefsLDsT5MXxeCbQBg==
X-Received: by 2002:a63:ea4c:0:b0:46b:2772:40a4 with SMTP id l12-20020a63ea4c000000b0046b277240a4mr1301049pgk.342.1666992222956;
        Fri, 28 Oct 2022 14:23:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001867fdec154sm3505586plf.224.2022.10.28.14.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 14:23:42 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-kbuild@vger.kernel.org, xin3.li@intel.com,
        llvm@lists.linux.dev
Cc:     Kees Cook <keescook@chromium.org>, nathan@kernel.org,
        hpa@zytor.com, peterz@infradead.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 0/1] kbuild: upgrade the orphan section warning to an error if CONFIG_WERROR is set
Date:   Fri, 28 Oct 2022 14:23:21 -0700
Message-Id: <166699219839.2165587.10773311882818616441.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025073023.16137-1-xin3.li@intel.com>
References: <20221025073023.16137-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 25 Oct 2022 00:30:22 -0700, Xin Li wrote:
> Andrew Cooper suggested upgrading the orphan section warning to a hard link
> error. However Nathan Chancellor said outright turning the warning into an
> error with no escape hatch might be too aggressive, as we have had these
> warnings triggered by new compiler generated sections, and suggested turning
> orphan sections into an error only if CONFIG_WERROR is set. Kees Cook echoed
> and emphasized that the mandate from Linus is that we should avoid breaking
> builds. It wrecks bisection, it causes problems across compiler versions, etc.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kbuild: upgrade the orphan section warning to an error if CONFIG_WERROR is set
      https://git.kernel.org/kees/c/450301ceb4e6

-- 
Kees Cook

