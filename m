Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747C072BE6E
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 12:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbjFLKMR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 06:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjFLKLk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 06:11:40 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD194237
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 02:51:47 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so29548555e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563506; x=1689155506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGyRaSD9SDDuTqMBkprQm/s8QBhbRXBL/EKCxQSwEgw=;
        b=VD9WYMabsIy42htPE0ZxGwA733ysx8DODDgloh9dS4WQo2inytJiqMIsykm/q9DcPo
         q+c3b9C9retl+dWzjqMbL/D6NTbtpSemjTOOX5sg7qFTm/s5V2QIJ+s6f8alpS39XtaF
         0egUHBgi3XUfCabvRQy2+LCbQeG/SsOeJxVzjDckusfSG3cEVHbqWokM8/0pPoE4X9Ow
         epdsebwZwxpcIEj/2fioozOjMBQRzId7I9AY9rdjBldhkNQzEH0ks49iHsFd7h72GQVQ
         thhSz9wUi+lkfGDZzMQcleJTGJ9ezkOqyh7TuSd+Bzu4eaqFCo0ZvXT2ydkXr+OiLvIz
         hmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563506; x=1689155506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGyRaSD9SDDuTqMBkprQm/s8QBhbRXBL/EKCxQSwEgw=;
        b=hXAvUpvDNMD0IFF0+kUg+vVXxhnCNkE6+qyMPs8TEoPNbcKD9Llbq8SGaTvp4ykbx/
         a1sk0k3ZmAtwNseK8OJZa0DsoDWeDc7x9oiDMhUw9kanrcRtFGmucGB//aOjU3Zwv2pb
         rkxeasDUVGz9YxhSlCZr7n6TrIhl6gWSBlL/0xg8rL1Kb+C+dstZ0y0uGFOvy9ytChP/
         o//npMM2U5C1TzrgUqrRCnEGWedP8wybHGn3vr4p1+/OLBAjPveKmutisiaSmWlvZGWA
         toLo0oBOsF2nPDRFhfbytPNngIHqRAVI56tXLK6c8pgRsKvqJ3dxZICpBVk01QjHxN1V
         lEwA==
X-Gm-Message-State: AC+VfDzD1WmJH+C9if1NevzEkpYc9AirkvTbqzN8ABd6WKCShxg6pxQa
        r0yTGTNVV/q6ohuqJjYhUoJx0g==
X-Google-Smtp-Source: ACHHUZ6EJEQi01CbQ4OG84YlGFAl7pB/nf3MDKlTaSaa1KC0zdljKIDHZvFvZX+pC/dkZaBsRgr4OQ==
X-Received: by 2002:a1c:6a0b:0:b0:3f6:da2:bc83 with SMTP id f11-20020a1c6a0b000000b003f60da2bc83mr5356464wmc.33.1686563505919;
        Mon, 12 Jun 2023 02:51:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s5-20020a7bc385000000b003f6132f95e6sm10887883wmj.35.2023.06.12.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:51:44 -0700 (PDT)
Date:   Mon, 12 Jun 2023 12:51:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org
Subject: Re: [bug report] modpost: handle relocations mismatch in __ex_table.
Message-ID: <cfabde17-49b1-457f-89b1-f13ec36be1c6@kadam.mountain>
References: <ZH7uxFaLhjul0jp1@moroto>
 <ZIbnPPQbrtmmRiQO@chrystal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIbnPPQbrtmmRiQO@chrystal>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 12, 2023 at 11:37:00AM +0200, Quentin Casasnovas wrote:
> 
> Have you already prepared a fix or shall I send it over?
> 

I sent the fix on Thursday and Masahiro Yamada already applied it.  I
Cc'd you but probably you're like me and respond to email in the order
it's recieved?

https://lore.kernel.org/all/CAK7LNATWmtiQdtvGLYL5b0Pyg4Bnmj0_Hn8xtWLzMJ_1oxkThA@mail.gmail.com/

regards,
dan carpenter

