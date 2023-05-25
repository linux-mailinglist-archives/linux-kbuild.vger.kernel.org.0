Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 861827113A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 20:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbjEYS1J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 14:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239117AbjEYS1D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 14:27:03 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA6F135
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:27:01 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-623f24b7ec9so537776d6.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685039221; x=1687631221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L1Ik6ysKjKmDTpM+2CKI8WkvvucU0bE1QXFD6+Kpvg=;
        b=hgcZOYkTB7IYsQHOFQevRURtgaXyzvg96iN/UkZaSZxOIeIQTUrthn6c3NgApqRqAd
         /OvpP5lmpTqco1BPvQn7Fh3ZF3iL0KrsAjDLAwUuEHQuflgVPmsUGoVhaewPChRai6Qz
         IiLW47sRNjhgkhbuIhH/YyJLRkzvqcAiRs8Dmsg9XRrqBv6eTUuQ1dn3frcZxNO7B1Bi
         rQSN7gldrhf7xUzfgGlBTmYUbG9H5QlRI/OWb4loCsRGnT6DgK5kq3ZgYQ9fEyf77mXn
         nfu0YnNEjY5ZpkP6Ymo1SAAzOZJO9Fxkjg1/2KEadeu0tTHH1jvkmR2qSmx0eBMztzzD
         iFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685039221; x=1687631221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L1Ik6ysKjKmDTpM+2CKI8WkvvucU0bE1QXFD6+Kpvg=;
        b=Lh8JG8kBW0NwM6hiUsShNyyI9gNYW8xSxFTomKzAynSKEYcLODNAUbeycAbKZFhUfT
         jEUzmcJQ5RR5F9iO77lKnM6X1lZMJknmyEtbFvmZIp8Dvm+fx47DTPNkVizaO5DrcZTG
         GAa+YSjTIxJB3gOYSFUCH/wd0NYjiYkfvdL6kQM2dF/Rc2vzGIh4j8CKsnCpODKjz2ju
         t0cr8LE3RPdjSXjcM7CgjlOZyEEfWzSSECp7Ae64HX3mIhV+k4CPWc/XDz6K7JlXPE9e
         9zxz5G22FGiO1Oc2UdKshsYBl0zA6MLPDZmgcvTsst3LxVZPWEaDioqP5kS4yMtsZg87
         y1TA==
X-Gm-Message-State: AC+VfDzlb4ETxrFqfmuzkmgzpfbHNFMhwygIjvr0RmEAPNeN7OPxfz0x
        oKoTwDF+D36yu+WG44XWYAiKCyzdAo/DD6HidRwN+w==
X-Google-Smtp-Source: ACHHUZ7hJ00+0392yVoaCOem32BJI0ayvlTB53ftHuich+eItb13C3VrKbIyK+a8MaLhm5HT2MTCscrnj+GygrTqrso=
X-Received: by 2002:a05:6214:2124:b0:625:aa49:9ab3 with SMTP id
 r4-20020a056214212400b00625aa499ab3mr3273504qvc.55.1685039220753; Thu, 25 May
 2023 11:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-21-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-21-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 25 May 2023 11:26:49 -0700
Message-ID: <CAKwvOdmwb3a-YvA4qN6=ed1YeQY_yG0qJnboX23CjCMOH8HmMQ@mail.gmail.com>
Subject: Re: [PATCH v6 20/20] modpost: show offset from symbol for section
 mismatch warnings
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Currently, modpost only shows the symbol names and section names, so it
> repeats the same message if there are multiple relocations in the same
> symbol. It is common the relocation spans across multiple instructions.
>
> It is better to show the offset from the symbol.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e7561fa57478..4da96746a03b 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1135,8 +1135,8 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>
>         sec_mismatch_count++;
>
> -       warn("%s: section mismatch in reference: %s (section: %s) -> %s (=
section: %s)\n",
> -            modname, fromsym, fromsec, tosym, tosec);
> +       warn("%s: section mismatch in reference: %s+0x%x (section: %s) ->=
 %s (section: %s)\n",
> +            modname, fromsym, (unsigned int)(faddr - from->st_value), fr=
omsec, tosym, tosec);

Is the cast necessary if you use the %p format specifier instead of 0x%x?

>
>         if (mismatch->mismatch =3D=3D EXTABLE_TO_NON_TEXT) {
>                 if (match(tosec, mismatch->bad_tosec))
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
