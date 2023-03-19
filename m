Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81ED06BFECA
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Mar 2023 02:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjCSBMV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Mar 2023 21:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjCSBMV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Mar 2023 21:12:21 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC02823116
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Mar 2023 18:12:19 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id x24-20020a4aca98000000b0053a9bbbe449so313475ooq.9
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Mar 2023 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1679188339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycST+XsFwDpZ7Jv6ndBMBSVMHZrpwHBOf36cyfuIYLk=;
        b=i7HHnol4KMV8G6t765GbNZgAVehCFWlO/YEc82h0Jd7tY0v3WGxF8aJlkp9m52mNv2
         nTknpUWYSJtLrlJSPIi4Q/EMRPDFsA+qdymSXHO8xlPUAT2VzfIT3IeifYn7Sv+eQ13I
         VS4BUSGz+3HFZRNHgAIqQ5lcyVYt2FWG1FkE7Gxj2QaDfwQV8MuxH/r1AV8uziggOFL1
         Q42zJW/JSpADxcelTogMwDashO0LIQxrsVbG5HEZO8sbOiKN9OeNEmvBqnSTKpsEi7Q2
         mHhEX8E7X7ElF0HLlKPvlP+JnrbjCSKTvnFeD6dUobcOKywaM4qk/tCt+Vr9lRDByOXh
         iLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679188339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycST+XsFwDpZ7Jv6ndBMBSVMHZrpwHBOf36cyfuIYLk=;
        b=fn6JQcalH3NzQm/peXAF5UUr8Xesd1UFeW36sfEEdghbS+qNCb1E8COAYon9R0o1/z
         IJuGYrzpKAVlL3G8zitQCMkz01nO1ygtSjNVLx7k/Z1QBb4FuIs6OSfM5uqijIX+prgm
         ImYv96S+pzrmfyyreL3R8lZ7b9ERyeU+FDB0To2Yh1V49wA3RaT6yvO7bDjurkXo6BHZ
         9kS7Hd9Z9CD3xoDuShRetbd0FZSDeFxCFe6addDKwVkW5r0jxTUDxcjVDirRcSbXKI4r
         eV9UePncHXs57yWBKLSapfYlg+ZAAvJOnshHgFeNeWDHeWGb4kQ+pS/gH/l76PIaCeOh
         U+yg==
X-Gm-Message-State: AO0yUKXo8pjq160n6t9wtsSCm/L0EqDTwKmBM1EDQr69t+DOLSJINn8i
        U9my2KM8oLJCCc1D02hq+k5t9g==
X-Google-Smtp-Source: AK7set/lF05CEy3MR4BKqaOi7AmvF768320vov4t8iJt/LfFZWj6WExMvkaXdRFPWwtc7ylu9dKbFA==
X-Received: by 2002:a4a:1e04:0:b0:520:f76:11e2 with SMTP id 4-20020a4a1e04000000b005200f7611e2mr2245907ooq.9.1679188339176;
        Sat, 18 Mar 2023 18:12:19 -0700 (PDT)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id b2-20020a4ae802000000b00525ccc4caadsm2511768oob.4.2023.03.18.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 18:12:18 -0700 (PDT)
From:   Steev Klimaszewski <steev@kali.org>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        terrelln@fb.com
Subject: Re: [PATCH 0/6] kbuild: fix some packaging issues, and use git-archive for source package
Date:   Sat, 18 Mar 2023 20:12:17 -0500
Message-Id: <20230319011217.147183-1-steev@kali.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312200731.599706-1-masahiroy@kernel.org>
References: <CAK7LNATXqPy6F+gB8-1Zqh8hooXh3U_5+3xeMFZDZwYsUi=aeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Sun, Mar 12, 2023 at 1:07 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This series fixes some bugs, then switch to 'git archive'
> for source package creation as suggested by Linus.

I apologize if this is a stupid question, but it's not immediately apparent to
me...

Previously, I was overriding the deb file output name by the setting of
LOCALVERSION_AUTO; but with this series applied, that seems to be ignored?

Now if I pass LOCALVERSION="" I end up with e.g. linux-image-6.3.0-rc2_6.3.0-rc2-00575-g46c71cad996d-100_arm64.deb
whereas previously, I would end up with linux-image-6.3.0-rc2_6.3.0-rc2-100_arm64.deb

How would I restore the old naming behaviour?

-- steev
