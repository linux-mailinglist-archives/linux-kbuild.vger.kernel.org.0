Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F59C6631BD
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 21:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbjAIUpr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 15:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjAIUpq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 15:45:46 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32AA4ECB8
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 12:45:45 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id v23so5971344plo.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 12:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UI3QmEyTzt2vGoW+rXIva7nnQIqT6mp5caaaDYa3q3s=;
        b=RvqetUe8b71Si4JZbdpPsA6WybRwDAXCqS+u+STGEcqMTN2WxPw7SMKyu1yLfUpsto
         j+R7Bo7Gv/PcJdVUX2CzA9U8uiKPo01ZFIxJmm5JQAcpUFqMgH8fmOk3ykh7+Ev9Yk6A
         snGP9wbgpslEI516ykfReqyRU9GoM5jxLs4s6uZpWekQpT6lv1MVEICFfp0UU6opXBPh
         hvBGPrIUyKd2nPJ973Wea6B7/6L05jjb28fzx0SZscqzyfBUWXUp87bs8czSr81v26QD
         Nqse8zdAtpNzEhQBDSPoGHq1Sd2h2g8xLDKzg4fIgXJQF7qS0coDtaUzIKYxnKUw9+ET
         Q/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UI3QmEyTzt2vGoW+rXIva7nnQIqT6mp5caaaDYa3q3s=;
        b=a+PT71C4oRpOz9WT6Cqvue06oZPQEEmuH9AaEdr2Iif3pxOYhjNGbJct+s5Qm9PkV+
         uwj6oJa/MnLB4PcyW7gBqOzvExmjvHX29f8eGj137H1cVJyy20KIrCJiiLGT+wEPJlrO
         h10zkpkR85OcYoaHfot+dW/WjmlDvSFzf+PLIW3C11pnFb86MjVHKBHKqdqMvMSoY9lO
         h/6FmPmruwVyWYWLa1AQpio6/G4DxUatZWyI3NlS8nEfjiToaP4+0m4JmEZ5BiN/Mp8H
         2/uN3s4viMo1HCCZ6G4SXvN6utZxvk88WE5etaCIsnQBBeFMRm6Z8ezNGjEdHmoNd4AL
         fhXg==
X-Gm-Message-State: AFqh2kqo9BCkDDqznFcXLdzoWe+6fQhrHAGHAW+XzvBax/aQ+GnRuzGg
        YjkcDuHeKT2RSHp8gFlCtEDdRA==
X-Google-Smtp-Source: AMrXdXusDW0vlZsH5jekwe1G7AR/6oHp5h2LYAZo26+MoZNoSEB2oH5REu2CSXVGXdhzYaYbWSoLcg==
X-Received: by 2002:a17:902:f292:b0:191:1543:6b2f with SMTP id k18-20020a170902f29200b0019115436b2fmr650806plc.3.1673297144970;
        Mon, 09 Jan 2023 12:45:44 -0800 (PST)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b0017f48a9e2d6sm6444589plh.292.2023.01.09.12.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 12:45:44 -0800 (PST)
Date:   Mon, 9 Jan 2023 12:45:40 -0800
From:   William McVicker <willmcvicker@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, kernel-team@android.com
Subject: modpost warning by default on missing Module.symvers
Message-ID: <Y7x89C9nAVX98T4g@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-16.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

I recently noticed that in commit 4475dff55c54 ("kbuild: fix false-positive
modpost warning when all symbols are trimmed") [1] you modified the modpost
behavior to always warn (by passing `-w`) when there are missing Module.symver
files in order to allow module builds to continue building with warnings
instead of errors. I'm curious why you decided to not continue to rely on
KBUILD_MODPOST_WARN to enable/disable that functionality?

I personally find it useful to keep these types of warnings as errors in order
to catch missing dependencies at build time (ideally by the CI build) instead
of at runtime when a module fails to load due to a missing symbol dependency.

Let me know your thoughts on this and I'll try to come up with a solution to
factor in any concerns you have.

Thanks,
Will

[1] https://lore.kernel.org/all/20210325185412.2352951-3-masahiroy@kernel.org/
