Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00BC723BD7
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 10:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236857AbjFFIcw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 04:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237163AbjFFIch (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 04:32:37 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C0BE40
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 01:32:05 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f7ebb2b82cso2355155e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jun 2023 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040265; x=1688632265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kB++PhHlerDXWQ/upgQj5fVd7+7YAMSRF3/D45QphIk=;
        b=qyt8XAnvqzgOoe4GWc3YHCvZtjgueXkXEc47dHbwtd9A4Pq0tNN2XHHTafOwPKIh0q
         11pLxLYKRs/i+zdmMP0kR/8Od+s4wMdlpZM7l1O9Yru3EAusOoxaH6LTtnF0YGwVJV2Q
         giDqzOqt9i6rY3QF1m1H/za0PtYGn8irCH0VPsqN7wIpQnfYNWdMtW1iOgrZ+Uns9QHL
         R1QOIwrAW7KN0TS6HKTf/mqXE8buAT83QzUJYcd8IboExI3F0V5Cr/4N92CqMwXdS5kw
         jxFxBvcJLnADl78FEg2/wTdU6ywVoHCAonOCQc5/xSADXbTJOiXddQqhhgmDpwo1dXKA
         +Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040265; x=1688632265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kB++PhHlerDXWQ/upgQj5fVd7+7YAMSRF3/D45QphIk=;
        b=NpLhUsUVdgEx7AU6QzbAk9SNkvOWu2DVpntMnYAGQfonzntISYTiJpshlVky3b4viA
         DH/68ccI+Jhli/HHriqYvnKSB3P+d7WO360dmHi6wWRUPyD/IalFFSH9PJUKsKlcY+Hr
         ODVkriOi9o/EMX2FHf5KJZR2CiNzIPNhixqq82Vy6F5CayomRDhShiFgAxcFe41tSKZt
         GFJN2tcIuA9lV6c6JAgwlYlpOH7WGoUxXPOXqlu6U1mqTvPwOFPSszP9RCB3B6MhXQU2
         /AGx28XZOcStDw2UWIkE10GRvkWB72MxDLsoSkPl2eF4gje3onADbNj+rQjSKccpQ3P1
         vgsQ==
X-Gm-Message-State: AC+VfDy1LDW1Yb1rlAfMpv41DJPC4bVq7nH2GdybjrQn3e7NMNRA3rOU
        LlBts7d2t8RlBWE20Y/vi4oKtQ==
X-Google-Smtp-Source: ACHHUZ4NlpXlQjDG3vonaG397ZoF+3XBpsdDBCxC/knGwmklMP29bEZKDB3TvdPBLOo1PAFPJRt7jw==
X-Received: by 2002:a1c:7203:0:b0:3f7:371a:ec8f with SMTP id n3-20020a1c7203000000b003f7371aec8fmr1336728wmc.15.1686040264934;
        Tue, 06 Jun 2023 01:31:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y20-20020a05600c365400b003f60a446fe5sm13321870wmq.29.2023.06.06.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:31:03 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:31:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     quentin.casasnovas@oracle.com,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org
Subject: [bug report] modpost: handle relocations mismatch in __ex_table.
Message-ID: <ZH7uxFaLhjul0jp1@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ Ancient code warning. - dan ]

Hello Quentin Casasnovas,

The patch 52dc0595d540: "modpost: handle relocations mismatch in
__ex_table." from Apr 13, 2015, leads to the following Smatch static
checker warning:

	./scripts/mod/modpost.c:1154 is_executable_section()
	warn: array off by one? 'elf->sechdrs[secndx]'

./scripts/mod/modpost.c
    1149 static bool is_executable_section(struct elf_info *elf, unsigned int secndx)
    1150 {
    1151         if (secndx > elf->num_sections)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
I'm not positive, but I think this should be >=.

    1152                 return false;
    1153 
--> 1154         return (elf->sechdrs[secndx].sh_flags & SHF_EXECINSTR) != 0;
                                      ^^^^^^
out of bounds read.

    1155 }

regards,
dan carpenter
