Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0767F60D453
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Oct 2022 21:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiJYTHp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Oct 2022 15:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiJYTHo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Oct 2022 15:07:44 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94347D7E12
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 12:07:43 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3321c2a8d4cso124218647b3.5
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QglMpokujQD49tkAIJsSoikNiyFqI/khYwYOp+rRE0c=;
        b=oAkt9AaK6MJ7zcIi7bgTGM889YqiiXsOSuw3wndAmyhd0vdZLIvgCpMO2YjHGOkNxR
         M5nQK8cTtNBgDLp+I/ajE5gA2EBXQWJhSu5+hpjzt+jR7n53GOMFXYw2cvmFTqcynCjK
         12qID4cy66a9anoBl0MSjF1lRbcksBpJugQvfMmnPeIyJha8N2GXfSXQDzkbyK7lHimf
         AlOi4v1Fg5Bxm2RzgJwwojmfA87FanzZrzZP5BzO2t1Xbo8v4YB3rh0bLIoKEvcnw9W1
         tmk17mxKK6dpaqqdgEw5pYyuq59CRDZRMMiEUA7mkMteWWYkwttcwGVUAokMFI9t2qXp
         k07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QglMpokujQD49tkAIJsSoikNiyFqI/khYwYOp+rRE0c=;
        b=jfI0aLzVq5xC5ZKFbEHMhxR6EZczMo5ah07918pOI0XThq7AV9Di9ldxZhqv+kgN1X
         noVgO9WEue7uU14/f/nzb1oQhkA29adVxll5+5zQaKhDjMrR+rKP5h5N+1jAB9m8xsXS
         lLnQS9plIDOOWJyZ6yZhx9nLmz1NZA9XqZOniXivSvUlqVIz1//x02IOsSB41q59juV9
         EZtAC+Nc1pHgSLurJxPUVfUTqh2GJolUEqA24h+1gF83ROSP+YxaRUv9UF+zP8yEH1P9
         3wLwIs68B660otnQd75fQmOYFR1H8ImMVmmwyfatpKygkrPrGycWZEK4OMkB8huY3SoR
         18rA==
X-Gm-Message-State: ACrzQf1i9ixSbWnlUHGmeogOGwSMh1oFiUwDZssd4PYfI19WOB128jxX
        NlZ8fnZ8YGcI59/OiRBb9BKSH0iutIr9VeG9hKevlvbqlNk=
X-Google-Smtp-Source: AMsMyM4+sZEx3v2gjS7ffJvvxqM8D519E7qQtj0u+R2NhGRVtJGB4VILj5K9Nmm5O3xM+HI2La5qVfi2kPbfmAxMD8M=
X-Received: by 2002:a81:7804:0:b0:369:1074:e2b with SMTP id
 t4-20020a817804000000b0036910740e2bmr25610487ywc.127.1666724862831; Tue, 25
 Oct 2022 12:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org> <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
In-Reply-To: <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 25 Oct 2022 22:07:31 +0300
Message-ID: <CAA8EJpotkSfP6xgm9s-8iS3FGsTss403RXcBuMwB_9=JFdispA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow validating individual dtb files against schema
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 16 Jul 2022 at 12:38, Masahiro Yamada <masahiroy@kernel.org> wrote:
> First, apply the following clean-up patch to reduce the code duplication.
> https://lore.kernel.org/all/20220716093122.137494-1-masahiroy@kernel.org/T/#u
>

The cleanup patch has been merged into 6.0.

> Then, apply the attached patch.diff

But the patch you proposed didn't seem to be posted. Do you still
intend to post it?

--
With best wishes
Dmitry
