Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A65768A362
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Feb 2023 21:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjBCUIU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Feb 2023 15:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjBCUIT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Feb 2023 15:08:19 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D79B3F2B2;
        Fri,  3 Feb 2023 12:08:18 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id x139so7584642ybe.13;
        Fri, 03 Feb 2023 12:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbAktXF0sS52IxrYG4Dn2gJYAu/jBTF+x12d/mOTZII=;
        b=Wiz0aMG4Js0A/WAmVfG7HL1sKB3JoSwjzoVDuQvMGYQmsRZyven0yKJvwh5r8fFIjz
         rEgac3suTmyEAvK/TEObT20pZn2YlUdb8sT4/a24yM0L6q0sOIT0CnNHFZ8Z+DUIdyIW
         VLgyY6Q/0Gl6pr+2L35XHheffsjp5qVDKBxCIGeqhs3mrbRgwX6kYIivVbkARiBPDxlj
         vcSG+X7begWqJ64rtCerteC7fpARTVcJuVmsSsd6svIknae18lr0qba6xe6gZjN9ugZ2
         exFmKVSxCLiIMou0X+5XfePc8UhPN2l8GacFksJ/2mprpCrPXTNlnXeTdRJyWfp/RX7B
         tIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbAktXF0sS52IxrYG4Dn2gJYAu/jBTF+x12d/mOTZII=;
        b=OEkLkmyRTGoRHkM8nMHVFRb1P4DMYmIAQ3IpjVU+tx0G8AFcH80XG1sogs2HQfKL8F
         5hu2Xm3IEzEGfbqShtJZkV4heeUsIAaw7vawVV+xaWXRCexLW9URN/yCpGlxSdfG+Wua
         H5zJg75lApeZckauHuzeibUWNXlAOj+XSLseZLndbGs5JN+e2YspUU0T/WQH+GpYIPe7
         P5NfWKM5x0UOqNvjEs35Ujc7xQhP1BDhjLrKrwUxdKTkuLAXxcbg4RuBvV5osmbcMsQa
         cYkKoQcwyJZc/igWIkd7EDLW/EK1FPKTZrvJh6pSv8R5o477NiWc77vNIusofCU1r1Ni
         axjQ==
X-Gm-Message-State: AO0yUKWQsA0bBdpXrUEUOp4IEDU1gRni76Cq8QgABE26vKotFVnQ5ABS
        Mxtqk0jrE4FG/Aer+sdN48xumgXJ/GphFcdz7JE=
X-Google-Smtp-Source: AK7set8QAfUmkO0afIZzcWhmNMfB38HtelV6yUemEGPZBg+nWShDSMi7b8rzAeI8UQlFx45ug6KRvre7r4P6v2bNsg4=
X-Received: by 2002:a05:6902:4e2:b0:80f:3b51:ddf5 with SMTP id
 w2-20020a05690204e200b0080f3b51ddf5mr1364611ybs.507.1675454897754; Fri, 03
 Feb 2023 12:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20230203173704.108942-1-mcanal@igalia.com>
In-Reply-To: <20230203173704.108942-1-mcanal@igalia.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 3 Feb 2023 21:08:06 +0100
Message-ID: <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
To:     =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 3, 2023 at 6:37 PM Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> rust-project.json is the configuration file used by rust-analyzer.
> As it is a configuration file and it is not needed to build external
> modules, it should be delete by make clean. So, delete rust-project.json
> when running make clean.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/939

Thanks Ma=C3=ADra! I will add a tag with Bj=C3=B6rn as a `Suggested-by`, if=
 he
is OK with that.

Cheers,
Miguel
