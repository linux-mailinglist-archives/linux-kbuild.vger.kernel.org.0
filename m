Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B636CC9E7
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Mar 2023 20:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjC1SKa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Mar 2023 14:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjC1SK1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Mar 2023 14:10:27 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA6F10DA
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 11:10:26 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso1975409pjc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680027026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km7fy08G4kEB/TIVNrsWE7yzaGFZ6oh8e34L/aCO/yQ=;
        b=R83hYeleOtndx4NUvnAHYwb3ZBN035iVXvYYlILl2mu16Uc7ElVT6LBee5DQA5DzEx
         YVO6um2mTbSnTFJUVIUlXHYTJqnkPOJqb6IgtxyGHuaOf0r5rpbtgCw4IVctTpkZ+tcU
         yFCj5COW7LLM17VjAOvLX+6xex6Ap5XvrpIaXkUTg3LS4S4UjdhcOdJdOw9zxSmzCQQ7
         A5TqmadJ3HICmmrDHQZn74h6sgyr9qAytATojC+WBLU26XRO7rh+dTVP2U7ZSb3Ced5s
         +3XCP6fL6jnWIU2JmcYq6U3SV++UPwMw+nR2JXXc5p1EAo6BU2XKGXMB3CqtVaWRVF24
         qMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680027026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km7fy08G4kEB/TIVNrsWE7yzaGFZ6oh8e34L/aCO/yQ=;
        b=YGKb2YGl58PE6So/2Fxh3PVb+Bup0xw442PON1xXKTHmG/s5K5W4noOhnG63dTbt7s
         tSWl1veJo6NwDT2KerjUkWsRQEIft9T+FkENV99hd5Z2eItZ99x3hTPl1YZGELYPSkT5
         pLydRZaXBWOA7zFM7lcoIMUA6gwgwwHRvLUOdWVFhfEUhhbnWboEHxJFhiYJyzVy4zUw
         Xq5lKazg7dZZCQTDKkUDnUaJ1IgvT9PdT1vxiFCzLeLjGD9F8Y0a7WoNRzrII/P/tggU
         VwqsdOJlnt7/pbt9nPSKM1EPZ5IUbVjKXSkaQG3DknKw6pAUxz+pqFuxAeooFAT3VHN1
         QzzQ==
X-Gm-Message-State: AAQBX9fEfqsLmEbx5boBZwxzwgdb0XsRoZ47k+J7iidmlKAuYmF05SCM
        VP4jY7L6KElf1i8x6fIl1ZY+Q2v64Zj8ocCdU49InQ==
X-Google-Smtp-Source: AKy350bFkxgwz+FUb0iSzHiaE8CVnyj+jl389Z/yYPw87cUFAUN68oO045VBikwAwq2dps1mbxyw1iJcbK9FYSAJMhs=
X-Received: by 2002:a17:90b:350c:b0:23b:349d:a159 with SMTP id
 ls12-20020a17090b350c00b0023b349da159mr8880302pjb.3.1680027025879; Tue, 28
 Mar 2023 11:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230327174140.8169-1-quic_johmoo@quicinc.com> <20230327174140.8169-3-quic_johmoo@quicinc.com>
In-Reply-To: <20230327174140.8169-3-quic_johmoo@quicinc.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 28 Mar 2023 11:10:14 -0700
Message-ID: <CAKwvOd=Za4=yOAXO-Aq+Jjw5TbQrc25xyVQne1sw4FE_h+3ybw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] docs: dev-tools: Add UAPI checker documentation
To:     John Moon <quic_johmoo@quicinc.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Matthias Maennich <maennich@google.com>,
        Giuliano Procida <gprocida@google.com>,
        kernel-team@android.com, libabigail@sourceware.org,
        Jordan Crouse <jorcrous@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 27, 2023 at 10:42=E2=80=AFAM John Moon <quic_johmoo@quicinc.com=
> wrote:
>
> Add detailed documentation for scripts/check-uapi.sh.
>
> Signed-off-by: John Moon <quic_johmoo@quicinc.com>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
--=20
Thanks,
~Nick Desaulniers
