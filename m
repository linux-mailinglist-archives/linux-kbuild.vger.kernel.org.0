Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F29324EA98
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Aug 2020 02:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgHWArl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 20:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgHWArk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 20:47:40 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24643C061573
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Aug 2020 17:47:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id s14so2550447plp.4
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Aug 2020 17:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uhjIrO61jeLA4z0GUtj1FtMpCz8Xcvx9fOtmkhhRjPw=;
        b=Vi7isoy9kUCedclnCeAKeau4EpYCUGA+78pKnEBrQaeYEycWE20h5UxdE7WjWnCXAE
         X+Lp9hOuMaCCzSBO41GxlGrzvMOch8hIzNmyvl0vBZ1/Vl0nnDyz3pgyDVW3p35xV+E/
         SEvZF9u+wczfocHfJUXYsnIQbsz2Deef/imhicZBwSKqncpA/03jv58rfyjim4tYrKQV
         nIwdp2C0u4pz1zGjOiaAIXmoxf7XPF+6tu+3LY5uTYhfYoQXJayrkJv716UFvFAlhKmb
         qabTGysNsw3RdKZwzx5TZxvierAOtZCjBtZMSQAIupEMMaF3d3/VfuaHgJB3oHLj4D6g
         34Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uhjIrO61jeLA4z0GUtj1FtMpCz8Xcvx9fOtmkhhRjPw=;
        b=VtXjNjOsrj4HnpVbeg3x6BIJpWY10Zw6HH8F1JGEaXCkJ56e3vRFMJ7GbB6MzvmN/J
         p/OGfyep2BF89FnCBAYPI/GMCIU4/GsmFsKd+HL/5VVAWY6PchI8sSGNz1kjNQBG/O3V
         RfE6ti/D1P+D7GzNfWF3Yr0ISKB8MCEcFsV8VGUu100JsIaZ02RFN4X0pL8KzdyDxWDT
         +6TU3vIXoyMpO7nK8HLXc/31cuVXcBDEMbydxN3DtN1NOwxNNc59UwTMX3G0aPACtTL6
         aQHF64BjrMej7+X7DKq+7Xdc0sZNolxTJAOrob7pXfooJkAODCGbuntqibuJDVpYhz0T
         RYcQ==
X-Gm-Message-State: AOAM5328dhgrNShHANafjKDNF0humNWGCD4mB1m38aTnVkX4L99KUj0V
        w5DEVPGB61C3a7wur/LPwSjWkyXxl8wi2eTH6NBQbQ==
X-Google-Smtp-Source: ABdhPJwMFgcJZoWamSqMTQUF1mFOFyZaszHbpQESduOD+dj7zH/6fqaJCU2aKXwkNpMjHGbkfxgMZaYs7RvNzJpkKxo=
X-Received: by 2002:a17:902:a60e:: with SMTP id u14mr6163835plq.179.1598143658875;
 Sat, 22 Aug 2020 17:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200822145618.1222514-1-masahiroy@kernel.org> <20200822145618.1222514-10-masahiroy@kernel.org>
In-Reply-To: <20200822145618.1222514-10-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Sat, 22 Aug 2020 17:47:28 -0700
Message-ID: <CAKwvOdnn=zK9yRtSMpbzWDzHZimvk=9u_kFD52wy1uprTwVkUg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] gen_compile_commands: remove the warning about
 too few .cmd files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 22, 2020 at 7:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This warning was useful when users previously needed to manually
> build the kernel and run this script.
>
> Now you can simply do 'make compile_commands.json', which updates
> all the necessary build artifacts and automatically creates the
> compilation database. There is no more worry for a mistake like
> "Oh, I forgot to build the kernel".
>
> Now, this warning is rather annoying.
>
> You can create compile_commands.json for an external module:
>
>   $ make M=/path/to/your/external/module compile_commands.json
>
> Then, this warning is displayed since there are usually less than
> 300 files in a single module.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v3:
>   - New patch
>
>  scripts/gen_compile_commands.py | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index f370375b2f70..1de745577e6d 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -21,11 +21,6 @@ _FILENAME_PATTERN = r'^\..*\.cmd$'
>  _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>
> -# A kernel build generally has over 2000 entries in its compile_commands.json
> -# database. If this code finds 300 or fewer, then warn the user that they might
> -# not have all the .cmd files, and they might need to compile the kernel.
> -_LOW_COUNT_THRESHOLD = 300
> -
>
>  def parse_arguments():
>      """Sets up and parses command-line arguments.
> @@ -236,11 +231,6 @@ def main():
>      with open(output, 'wt') as f:
>          json.dump(compile_commands, f, indent=2, sort_keys=True)
>
> -    count = len(compile_commands)
> -    if count < _LOW_COUNT_THRESHOLD:
> -        logging.warning(
> -            'Found %s entries. Have you compiled the kernel?', count)
> -
>
>  if __name__ == '__main__':
>      main()
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
