Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9381B6147
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 18:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbgDWQsT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 12:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729716AbgDWQsT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 12:48:19 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DA0C09B041;
        Thu, 23 Apr 2020 09:48:19 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m18so7187175otq.9;
        Thu, 23 Apr 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bh0M22ljnn7wAk7TqVlJbCHIzOAS6jwjmvuWuteywQk=;
        b=YelSMpK6UYl4wPJ243K10x9IaOyTRkHv04jg6GMmVYSYzCjHGEdcllHqBdt3QukHub
         2q+L3FbWwosVkRLfyrCESZWhbj93LY9/YnIL/y9wSV2JqYgCCrY+4w6q6M/55LVPmVCc
         g8tE+1nxihdEbF2U8hHui3YW8EAMo9xAGCk+EeGoP5Qy0QKDXHelRjv/fFw6WnmxEE07
         tq4SOpyb39RERQ0cI06PhpWP7akf3lEY1rjuCklFTKci+wpgmVO63/UkkQwK7pzrx8OP
         Ufn9UCy0YB7Q1LXGNka5UaMLHhdcpmBgSc/6RrmuS2m35fOO763dmqtK9++c1QKkfYFz
         15xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bh0M22ljnn7wAk7TqVlJbCHIzOAS6jwjmvuWuteywQk=;
        b=H88RcYG8auttTYUauSz5cTqbGMTMv1YIs38yPvqf38Q3bpvodh9YzzhvNyNrLCrgy2
         N2B0rNK9ta80jObnfjUV6TBSoPpDyIhBO9ed1NikOcVUCZGB3Athsj4/HIv6dMpTMobE
         ZekwiojFv9i+E2jvKR6m0y4HfJYy6v5Jz2miK3ppLFzUULDNAgI/fQgSY1q8dJKH6iJ2
         47KJsdosjOcRuTNy2mKBIdC5ritTZ21bj6XdHpjUejOvxg0XjPjeak3ybrIk0hPkKxF0
         BdQX9VZ/b3rFJrbVK/CjZSwY6O/I/o4dCJmSWhkE/6MtqbmW6PHZtrOqQwr/IalpmkS0
         avsg==
X-Gm-Message-State: AGi0PuYQBGPUVzJ3OeNFENYmrwzNnP5Y2CAM0oIkBMtvRvYG0md6LnWB
        1Ee+0rvc5R4wkWSfxAvOpto=
X-Google-Smtp-Source: APiQypIDjXakw5+CsR051thcbpc5b4wm1P7FVM+FxdlZiT46LPYnOIQIo9zN5hsgv9IT+eMJKXZ6wg==
X-Received: by 2002:a05:6830:1d62:: with SMTP id l2mr2441949oti.316.1587660498522;
        Thu, 23 Apr 2020 09:48:18 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id w24sm799343oor.47.2020.04.23.09.48.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 09:48:17 -0700 (PDT)
Date:   Thu, 23 Apr 2020 09:48:16 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] kbuild: use $(CC_VERSION_TEXT) to evaluate
 CC_IS_GCC and CC_IS_CLANG
Message-ID: <20200423164816.GA12996@ubuntu-s3-xlarge-x86>
References: <20200423142354.312088-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 23, 2020 at 11:23:51PM +0900, Masahiro Yamada wrote:
> The result of '$(CC) --version | head -n 1' is already computed by the
> top Makefile, and stored in the environment variable, CC_VERSION_TEXT.
> 
> 'echo' is probably less expensive than the two commands $(CC) and
> 'head' although this optimization is not noticeable level.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
