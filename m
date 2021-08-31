Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF8E3FCED0
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 22:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241232AbhHaUui (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 16:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhHaUuh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 16:50:37 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD52C061575;
        Tue, 31 Aug 2021 13:49:42 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so460597pjq.1;
        Tue, 31 Aug 2021 13:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+VwqWzlQd0bwFmrYU/A5aapOrfg1k7jNvsAz6oqsjSk=;
        b=aObe45tP4fRqFS+ujpgUyLzKfwt4SIAx8G6sjeM5x833KJsU8PwZtW8jFTY/ue/OB1
         jxq1Lf2tsvJZJf9Ew1pfi9jHvoGDol1362QVC/zF7G2EzYOxDmb57oVhlHW8W8tpHkx4
         gzlGYkl5LoTkAAIwn+f+thTBYOm/9VjH7+zUVRXIt7fJI0x0gl6UThJ51n/GhNKrxmPE
         nL9nCsFpWaBL3PgXcbaFh8//Lkr4aZCPzfxGjkE7jNIUpen0r8VBt1KZKhqVOBcWndHY
         kWIAcdJSVhhKqtpt+sqGHlGFGjU0yAunyvkUarZ7UGNdhYEnOLth5e09w2RBrnPGV5GS
         7egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+VwqWzlQd0bwFmrYU/A5aapOrfg1k7jNvsAz6oqsjSk=;
        b=TegYZJWct9qCDW/XQ+1visagRqHnlM3jZX3y/F7AT/lK6jf3tP/qM9lOifvP1hert2
         70OCB3RTNRjUBbxQNaEE3oxNScMP13BUmWotiqSKKHsNi6yU7IUMLtlVEcUNzqitKKa1
         IWM3DgFNKm5NAKNrANTVEbel+UtjjLtkBhR3C6RFoDM9KuhMWS0MYi1b8zkTGqzqCWCq
         CkwwmlU3OcToMa0vmttqZJxykyrYl+xFCZ+SUOVDhCj4+2uvMotQ5lLWoIRoFb4lB/Rz
         pXvcNiTp47lX7+p4/b0MbN7gEIq1aW1rSD7n28nToTw3RCHY02BJmjlcrukm0z+Ly7Mp
         VcFg==
X-Gm-Message-State: AOAM530fKCMMmTZIac0HJksqgoM0H5LA9kV+A7C3C5IyG3W1yYnK9mLj
        7baAyKoQ11rx0f00esl3gbGFwzDj3y4=
X-Google-Smtp-Source: ABdhPJw65oVh7dCRrS1w+sYI5jNapkVdWQmQFN5nHlNVaALSMC7aQObtjXMwKZYQNVRqWSpDJdKBjQ==
X-Received: by 2002:a17:90a:1f4c:: with SMTP id y12mr7180671pjy.60.1630442981280;
        Tue, 31 Aug 2021 13:49:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q4sm3520936pjd.52.2021.08.31.13.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 13:49:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 4/5] Makefile: Enable -Warray-bounds
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Keith Packard <keithp@keithp.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
References: <20210827163015.3141722-1-keescook@chromium.org>
 <20210827163015.3141722-5-keescook@chromium.org>
 <20210831043128.GA2749311@roeck-us.net> <202108311042.FFE1818D@keescook>
 <3ab153ec-2798-da4c-f7b1-81b0ac8b0c5b@roeck-us.net>
 <202108311317.DFFFCFC74@keescook>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6565714b-6c25-b244-1aad-5111b9667b30@roeck-us.net>
Date:   Tue, 31 Aug 2021 13:49:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108311317.DFFFCFC74@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/31/21 1:18 PM, Kees Cook wrote:
> On Tue, Aug 31, 2021 at 12:40:53PM -0700, Guenter Roeck wrote:
>> The configuration doesn't matter; it fails for me for all configurations,
>> including defconfig, alllnoconfig, and allmodconfig.
>> Key is to use gcc 11.2. The image builds just fine with gcc 9.4 and 10.3.
> 
> Ah! Yes, heh. That would be my problem; I've got 10.3 for my builders.
> Thanks! I will give 11.2 a spin.
> 
In case you don't have gcc 11.2 available - I tested with 11.1 as well;
that also fails.

Guenter

