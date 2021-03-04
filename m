Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC88732DD52
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 23:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbhCDWsB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 17:48:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhCDWsA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 17:48:00 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924D2C061756
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Mar 2021 14:48:00 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id t1so7177415eds.7
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 14:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZenlJQFA1xDTsw9FUHFvOUXMNXl/rtF+zHRhBj+rKe8=;
        b=W2TJ9WAVbEU2oA8T98//QwSrArW5Wtpn+MhbY1qYXakjG7oGP0JieGFPuXPK36dxJe
         /qoXEmje7Ad2XW2oSdkrX4puy+P397ItlnxVEQS7Oh1zRMJdSWitGPvbWCtRPoLLqGhN
         tGw/gnu16NJNEYL3vwTC42PJFGlBPuwsEi0Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZenlJQFA1xDTsw9FUHFvOUXMNXl/rtF+zHRhBj+rKe8=;
        b=TvQB/5JBJlAsKfONquDKZAW9fAToony27b8GbOovfWTP6dmxLsPX9d/ulwuYl3bK9N
         VmFqm/yG7DsaWc1XKuZyo/rbdcoIH1zNxnPEHcrnIlfNIwfzlgbr2gFah2rAfAnHuRqM
         7xJQcl5i98Z9dcESwsNxKvRjVILL446sgszO+JSdcrIWjh8xUH0sjkSp7YLYrWSe69pB
         9w1hnMBvt4N1gOHdonQXw6Q1Vzu+w+2ELK8W/GhO8g4f9T+l3Ii2d4Shg0qDSuFVi7Nx
         xUpErJHVex1a9emMldtWeGq1QG23DGsU8v4ls8wurKy4OhNN3xwbSJXY5n/+6mAQyUo+
         UR6w==
X-Gm-Message-State: AOAM533gd3YQ4VvKskoCBel0O/TxEyVNezB7qaqUpNiBtFbLxzzTXODq
        fZQv6yf9xuX//jDoV/fejD1Ibnvh7qYPLQ==
X-Google-Smtp-Source: ABdhPJy/OZKIA+zFXfUa2SSu7+OFPtP3Vobhf6V49tICcP6E5CQgV5bHSJP02QKIuyYEgeArUwV2+Q==
X-Received: by 2002:aa7:de82:: with SMTP id j2mr6729312edv.313.1614898079195;
        Thu, 04 Mar 2021 14:47:59 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q10sm412985eds.67.2021.03.04.14.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 14:47:58 -0800 (PST)
Subject: Re: [PATCH] kbuild: add CONFIG_VMLINUX_MAP expert option
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20210224105256.1939169-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <66943f68-c01e-2f20-f0f0-ad63375c3209@rasmusvillemoes.dk>
Date:   Thu, 4 Mar 2021 23:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224105256.1939169-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 24/02/2021 11.52, Rasmus Villemoes wrote:
> It can be quite useful to have ld emit a link map file, in order to
> debug or verify that special sections end up where they are supposed
> to, and to see what LD_DEAD_CODE_DATA_ELIMINATION manages to get rid
> of.
> 
> The only reason I'm not just adding this unconditionally is that the
> .map file can be rather large (several MB), and that's a waste of
> space when one isn't interested in these things. Also hide the prompt
> behind CONFIG_EXPERT.

ping
