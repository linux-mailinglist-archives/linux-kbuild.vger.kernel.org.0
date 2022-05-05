Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8616951CAA2
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 May 2022 22:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384982AbiEEUe6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 May 2022 16:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244935AbiEEUe5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 May 2022 16:34:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0B25EDF8
        for <linux-kbuild@vger.kernel.org>; Thu,  5 May 2022 13:31:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p10so9315997lfa.12
        for <linux-kbuild@vger.kernel.org>; Thu, 05 May 2022 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KzJXnZ7chU1+5zJp4Dgvp3VaPPi5u4rVhagYP/eqQQE=;
        b=GcsLNO3ybt8b4qYioRwjRsGo24/f0OAD/JE388Gc5emmRyTIhlyYUbKzIgZyv53hb1
         xhiVCmKW0WOkPCvBf1e4g28vMmUQUkmrVh+o51YOtKO8cBVzloYHCXntPyZO/l8A9u4M
         5CxbT9nvJ8k+TaFHNOPLcGCSi7HogLmrn63TqdbSnLG4WHsAsFmI3EppXVPekhAxB05a
         NEbtgx7QVCxIiRy2eSQmkdwO62yYlPePGIiYe39mbWzh5zAEXFGIG2orgZSXN6r69srE
         z8JRd8pqir9+V0J5tZrITxsJOR+WTOS0fPBTlN8HA0KMIdLI2QtAq3P5nFh0k988K2Jw
         qG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KzJXnZ7chU1+5zJp4Dgvp3VaPPi5u4rVhagYP/eqQQE=;
        b=C9BZjM3fE3YXXxe7K0Gdkcli+T9UtLHLLqRtKscWXPTM41u+MK2w3OLsZYmq9Iu1/M
         OXgDeCfvgHu+mFIbf0CSVcx3gQVbI+1H8r//ANw0/UnIQuIjcqIVNsFM1lppChz2clZU
         CJAAmMKzu93SwUKwpgNZyW8GGsdalQgWWPqBImiTZ79x1lsa5335RvXluf2PHs4QqJLe
         6nwuwQhg7iQXHhcrtcS6YzkMgMSlZR88ErA4+LdoaGsHQxRp3s9F5nLzYR6twuqAY5u7
         AsBDztnt1bWh+uOlAO8Sa9HvZE9UdzBJExTijphT0+FtIdIbHOqijPR/ngTmCA5aHiwg
         BONg==
X-Gm-Message-State: AOAM531cBoY8g2zc2EKY5KL95H0YXDlG0C41k0ekv4VkwALpm/C1qMZq
        oNjawhP80usOq0QbHJt1IUXjDNwgtzheO9x/MBHgxoj7knI=
X-Google-Smtp-Source: ABdhPJwbhs3kr3NEQrD1kb2FM5lFdKjT3Fw4s9E6Bf+BV+NG8NhQY5rDLxGeb5Ices7vG2JpejLiHgrpcihMdzG04I8=
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id
 b6-20020ac25e86000000b00473d04460f5mr49308lfq.87.1651782674718; Thu, 05 May
 2022 13:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220505072244.1155033-1-masahiroy@kernel.org> <20220505072244.1155033-15-masahiroy@kernel.org>
In-Reply-To: <20220505072244.1155033-15-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 5 May 2022 13:31:03 -0700
Message-ID: <CAKwvOdkTOv1VZti3KH9zxXT1xceogUPxdCV1JqoYbTKtdUy0qw@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] kbuild: make built-in.a rule robust against too
 long argument error
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
        linux-s390@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 5, 2022 at 12:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Kbuild runs at the top of objtree instead of changing the working
> directory to subdirectories. I think this design is nice overall but
> some commands have a scapability issue.

s/scapability/scalability/


-- 
Thanks,
~Nick Desaulniers
