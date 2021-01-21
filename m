Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF422FE13C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 05:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbhAUDwn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 22:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393193AbhAUCWf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 21:22:35 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C068C061757;
        Wed, 20 Jan 2021 18:21:55 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id p72so1033523iod.12;
        Wed, 20 Jan 2021 18:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Vp+AOE092k68RqEbMcBCp9/Ukm2GwYnsZJxTSLbTqcQ=;
        b=fk76+8fpscXt1+UtR91rPJtqdpvBCfunS2NPWqFQX9XISsq0PZ8sH/qv3WZdswrS9q
         DBvz/hwuLuOnz6LxyrR7Yg2cPoY4IKujYQXSSn49u8Kkkg6rP2pKxo/xivj/vVkCUvaX
         GE4dNzLplqnAjW6YqsjmA4/fcWuv7lVhMETdXXNpzjr+coY5QFZXIM+yX7an5C0WMM6V
         DMIOD4AF9DbkiQn2A4iZLTa7HwNCn4jHMABDokxaHtRcA19scknWYvHCZnbWMqRfCCi0
         LusnYl4D191C2qNGhOnqQ5GiFFD3u9ED0FlIKYxc5Y8Z2zVkUsrC6c+cRQ001FE1AmYf
         snAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Vp+AOE092k68RqEbMcBCp9/Ukm2GwYnsZJxTSLbTqcQ=;
        b=Nl7CwRVBADKK7a/Dj6HEDBeS3S/AGLR1R6TMgf3MNIlujO9CEBMUfFIg+xBTkGHXku
         VcDRTATZGk/jPyJzIe9CHEQr5mzXXaczn1XR5zuj+mm7s/+YsS0ugmfmHdLlVUDGyQiV
         bYRwEuTzaj4vLj0k6zz/iDF7Wmz1eNY1J8TLpTTBqdvc88KRaMIN1FfHBo8+sYgISF5W
         RBkZem4GDXzF48WE8bFw6WxV20a4wv7BAvHslB368stqCTzdWV1AoIGg8BKhJs+MFUVi
         abEYyrSCZqbFQ+vGWWYZ3f4AV2kW2eoYp8xhW1h5c3yauc8zVb9y0HCdoc3E/+wL2RZL
         9J9w==
X-Gm-Message-State: AOAM532bBpgxnM/A1WNaa/2clePiLnPOmhzFFxvub0ga9CubOCD0eOUc
        6PjXOnHa6Hm0hBTvJJNMGAve3gHdsuL0Lh2zpvY=
X-Google-Smtp-Source: ABdhPJxqCkgCdrYcxYFCtLfGMFZ/MHc8v+nNvK72BdWKJAS/FL85R1C2E6kKD/X0Qh7o4tQw39V9m84rZ4g5W4c4iAo=
X-Received: by 2002:a02:2ace:: with SMTP id w197mr10061595jaw.132.1611195714793;
 Wed, 20 Jan 2021 18:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com>
In-Reply-To: <20210111081821.3041587-1-morbo@google.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 21 Jan 2021 03:21:43 +0100
Message-ID: <CA+icZUW63tP7kzWCKofJH0E0xA7yLCYpSOYz_aw1D4mkhNhW=w@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: multipart/mixed; boundary="0000000000003e955e05b95fbcbc"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--0000000000003e955e05b95fbcbc
Content-Type: text/plain; charset="UTF-8"

Hi,

When I looked through the code I wondered why we do not add a
"CONFIG_PGO_CLANG_PROFDATA" which can be helpful when doing the PGO
rebuild with a vmlinux.profdata.

This introduces a "PGO_PROFDATA" to turn on/off to pass
"-fprofile-use=vmlinux.profdata" (see CFLAGS_PGO_CLANG_PROFDATA in
top-level Makefile).

If we turn off via "PGO_PROFILE := n" in several Makefiles - we should
do the same and add "PGO_PROFDATA := n" to the same Makefiles?

Please see the attached diff.

Regards,
- Sedat -

--0000000000003e955e05b95fbcbc
Content-Type: text/x-patch; charset="US-ASCII"; name="CONFIG_PGO_CLANG_PROFDATA.diff"
Content-Disposition: attachment; filename="CONFIG_PGO_CLANG_PROFDATA.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kk689dua0>
X-Attachment-Id: f_kk689dua0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggZGQ1OGZjYTY1YzlmLi5kOWE0
ODI3OWM0ZDUgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC02NjAsNyAr
NjYwLDggQEAgZW5kaWYgIyBLQlVJTERfRVhUTU9ECiBhbGw6IHZtbGludXgKIAogQ0ZMQUdTX1BH
T19DTEFORyA6PSAtZnByb2ZpbGUtZ2VuZXJhdGUKLWV4cG9ydCBDRkxBR1NfUEdPX0NMQU5HCitD
RkxBR1NfUEdPX0NMQU5HX1BST0ZEQVRBIDo9IC1mcHJvZmlsZS11c2U9dm1saW51eC5wcm9mZGF0
YQorZXhwb3J0IENGTEFHU19QR09fQ0xBTkcgQ0ZMQUdTX1BHT19DTEFOR19QUk9GREFUQQogCiBD
RkxBR1NfR0NPVgk6PSAtZnByb2ZpbGUtYXJjcyAtZnRlc3QtY292ZXJhZ2UgXAogCSQoY2FsbCBj
Yy1vcHRpb24sLWZuby10cmVlLWxvb3AtaW0pIFwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3Qv
TWFrZWZpbGUgYi9hcmNoL3g4Ni9ib290L01ha2VmaWxlCmluZGV4IDM4Mzg1M2UzMmY2Ny4uMzI2
OGQxZWU2ZTQ1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9ib290L01ha2VmaWxlCisrKyBiL2FyY2gv
eDg2L2Jvb3QvTWFrZWZpbGUKQEAgLTcyLDYgKzcyLDcgQEAgS0JVSUxEX0NGTEFHUwkrPSAkKGNh
bGwgY2Mtb3B0aW9uLC1mbWFjcm8tcHJlZml4LW1hcD0kKHNyY3RyZWUpLz0pCiBLQlVJTERfQ0ZM
QUdTCSs9IC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMKIEdDT1ZfUFJPRklMRSA6PSBu
CiBQR09fUFJPRklMRSA6PSBuCitQR09fUFJPRkRBVEEgOj0gbgogVUJTQU5fU0FOSVRJWkUgOj0g
bgogCiAkKG9iaikvYnpJbWFnZTogYXNmbGFncy15ICA6PSAkKFNWR0FfTU9ERSkKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9NYWtlZmlsZSBiL2FyY2gveDg2L2Jvb3QvY29t
cHJlc3NlZC9NYWtlZmlsZQppbmRleCBlZDEyYWI2NWY2MDYuLjcwN2M0MDM0YWVmNyAxMDA2NDQK
LS0tIGEvYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxlCisrKyBiL2FyY2gveDg2L2Jv
b3QvY29tcHJlc3NlZC9NYWtlZmlsZQpAQCAtNTUsNiArNTUsNyBAQCBDRkxBR1Nfc2V2LWVzLm8g
Kz0gLUkkKG9ianRyZWUpL2FyY2gveDg2L2xpYi8KIEtCVUlMRF9BRkxBR1MgIDo9ICQoS0JVSUxE
X0NGTEFHUykgLURfX0FTU0VNQkxZX18KIEdDT1ZfUFJPRklMRSA6PSBuCiBQR09fUFJPRklMRSA6
PSBuCitQR09fUFJPRkRBVEEgOj0gbgogVUJTQU5fU0FOSVRJWkUgOj1uCiAKIEtCVUlMRF9MREZM
QUdTIDo9IC1tIGVsZl8kKFVUU19NQUNISU5FKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvY3J5cHRv
L01ha2VmaWxlIGIvYXJjaC94ODYvY3J5cHRvL01ha2VmaWxlCmluZGV4IGJhYTE0ZjgzZWRhZS4u
MWIyY2I5MTQyNjcyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9jcnlwdG8vTWFrZWZpbGUKKysrIGIv
YXJjaC94ODYvY3J5cHRvL01ha2VmaWxlCkBAIC01LDYgKzUsNyBAQAogT0JKRUNUX0ZJTEVTX05P
Tl9TVEFOREFSRCA6PSB5CiAKIFBHT19QUk9GSUxFX2N1cnZlMjU1MTkteDg2XzY0Lm8gOj0gbgor
UEdPX1BST0ZEQVRBX2N1cnZlMjU1MTkteDg2XzY0Lm8gOj0gbgogCiBvYmotJChDT05GSUdfQ1JZ
UFRPX1RXT0ZJU0hfNTg2KSArPSB0d29maXNoLWk1ODYubwogdHdvZmlzaC1pNTg2LXkgOj0gdHdv
ZmlzaC1pNTg2LWFzbV8zMi5vIHR3b2Zpc2hfZ2x1ZS5vCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9l
bnRyeS92ZHNvL01ha2VmaWxlIGIvYXJjaC94ODYvZW50cnkvdmRzby9NYWtlZmlsZQppbmRleCBm
NzQyMWU0NDcyNWEuLjY3ODYwZWNkZTU0MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50cnkvdmRz
by9NYWtlZmlsZQorKysgYi9hcmNoL3g4Ni9lbnRyeS92ZHNvL01ha2VmaWxlCkBAIC0xODEsNiAr
MTgxLDcgQEAgVkRTT19MREZMQUdTID0gLXNoYXJlZCAtLWhhc2gtc3R5bGU9Ym90aCAtLWJ1aWxk
LWlkPXNoYTEgXAogCSQoY2FsbCBsZC1vcHRpb24sIC0tZWgtZnJhbWUtaGRyKSAtQnN5bWJvbGlj
CiBHQ09WX1BST0ZJTEUgOj0gbgogUEdPX1BST0ZJTEUgOj0gbgorUEdPX1BST0ZEQVRBIDo9IG4K
IAogcXVpZXRfY21kX3Zkc29fYW5kX2NoZWNrID0gVkRTTyAgICAkQAogICAgICAgY21kX3Zkc29f
YW5kX2NoZWNrID0gJChjbWRfdmRzbyk7ICQoY21kX3Zkc29fY2hlY2spCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9wbGF0Zm9ybS9lZmkvTWFrZWZpbGUgYi9hcmNoL3g4Ni9wbGF0Zm9ybS9lZmkvTWFr
ZWZpbGUKaW5kZXggNWYyMmIzMTQ0NmFkLi41ZDY0YjcyOGEwYTAgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3BsYXRmb3JtL2VmaS9NYWtlZmlsZQorKysgYi9hcmNoL3g4Ni9wbGF0Zm9ybS9lZmkvTWFr
ZWZpbGUKQEAgLTMsNiArMyw3IEBAIE9CSkVDVF9GSUxFU19OT05fU1RBTkRBUkRfZWZpX3RodW5r
XyQoQklUUykubyA6PSB5CiBLQVNBTl9TQU5JVElaRSA6PSBuCiBHQ09WX1BST0ZJTEUgOj0gbgog
UEdPX1BST0ZJTEUgOj0gbgorUEdPX1BST0ZEQVRBIDo9IG4KIAogb2JqLSQoQ09ORklHX0VGSSkg
CQkrPSBxdWlya3MubyBlZmkubyBlZmlfJChCSVRTKS5vIGVmaV9zdHViXyQoQklUUykubwogb2Jq
LSQoQ09ORklHX0VGSV9NSVhFRCkJCSs9IGVmaV90aHVua18kKEJJVFMpLm8KZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmlsZSBiL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmls
ZQppbmRleCAzNmYyMGU5OWRhMGIuLjk5ZjJlNGMxODg2ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
cHVyZ2F0b3J5L01ha2VmaWxlCisrKyBiL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmlsZQpAQCAt
MjQsNiArMjQsNyBAQCB0YXJnZXRzICs9IHB1cmdhdG9yeS5ybyBwdXJnYXRvcnkuY2hrCiAjIFNh
bml0aXplciwgZXRjLiBydW50aW1lcyBhcmUgdW5hdmFpbGFibGUgYW5kIGNhbm5vdCBiZSBsaW5r
ZWQgaGVyZS4KIEdDT1ZfUFJPRklMRQk6PSBuCiBQR09fUFJPRklMRQk6PSBuCitQR09fUFJPRkRB
VEEJOj0gbgogS0FTQU5fU0FOSVRJWkUJOj0gbgogVUJTQU5fU0FOSVRJWkUJOj0gbgogS0NTQU5f
U0FOSVRJWkUJOj0gbgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvcmVhbG1vZGUvcm0vTWFrZWZpbGUg
Yi9hcmNoL3g4Ni9yZWFsbW9kZS9ybS9NYWtlZmlsZQppbmRleCAyMTc5NzE5MmY5NTguLmE0OTU4
OTBlOWIxMSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvcmVhbG1vZGUvcm0vTWFrZWZpbGUKKysrIGIv
YXJjaC94ODYvcmVhbG1vZGUvcm0vTWFrZWZpbGUKQEAgLTc3LDQgKzc3LDUgQEAgS0JVSUxEX0FG
TEFHUwk6PSAkKEtCVUlMRF9DRkxBR1MpIC1EX19BU1NFTUJMWV9fCiBLQlVJTERfQ0ZMQUdTCSs9
IC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMKIEdDT1ZfUFJPRklMRSA6PSBuCiBQR09f
UFJPRklMRSA6PSBuCitQR09fUFJPRkRBVEEgOj0gbgogVUJTQU5fU0FOSVRJWkUgOj0gbgpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvdW0vdmRzby9NYWtlZmlsZSBiL2FyY2gveDg2L3VtL3Zkc28vTWFr
ZWZpbGUKaW5kZXggNTRmNTc2OGY1ODUzLi4yZTljZGMxMzdhZGUgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3VtL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC94ODYvdW0vdmRzby9NYWtlZmlsZQpAQCAt
NjUsNiArNjUsNyBAQCBxdWlldF9jbWRfdmRzbyA9IFZEU08gICAgJEAKIFZEU09fTERGTEFHUyA9
IC1mUElDIC1zaGFyZWQgLVdsLC0taGFzaC1zdHlsZT1zeXN2CiBHQ09WX1BST0ZJTEUgOj0gbgog
UEdPX1BST0ZJTEUgOj0gbgorUEdPX1BST0ZEQVRBIDo9IG4KIAogIwogIyBJbnN0YWxsIHRoZSB1
bnN0cmlwcGVkIGNvcHkgb2YgdmRzbyouc28gbGlzdGVkIGluICQodmRzby1pbnN0YWxsLXkpLgpk
aWZmIC0tZ2l0IGEva2VybmVsL3Bnby9LY29uZmlnIGIva2VybmVsL3Bnby9LY29uZmlnCmluZGV4
IDVmZTk2MzVhYzY0Yy4uY2UxZTFjMDYxYTk4IDEwMDY0NAotLS0gYS9rZXJuZWwvcGdvL0tjb25m
aWcKKysrIGIva2VybmVsL3Bnby9LY29uZmlnCkBAIC0zMiw0ICszMiw4IEBAIGNvbmZpZyBQR09f
Q0xBTkcKIAkgIE5vdGUgdGhhdCB0aGUgZGVidWdmcyBmaWxlc3lzdGVtIGhhcyB0byBiZSBtb3Vu
dGVkIHRvIGFjY2VzcwogCSAgcHJvZmlsaW5nIGRhdGEuCiAKK2NvbmZpZyBQR09fQ0xBTkdfUFJP
RkRBVEEKKwlib29sICJVc2Ugdm1saW51eC5wcm9mZGF0YSBwcm9maWxlIGZpbGUiCisJZGVwZW5k
cyBvbiAhUEdPX0NMQU5HCisKIGVuZG1lbnUKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUu
bGliIGIvc2NyaXB0cy9NYWtlZmlsZS5saWIKaW5kZXggMTJmZWQ4MjVhYjRiLi4xNDE2OWE1NzVi
NjQgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubGliCisrKyBiL3NjcmlwdHMvTWFrZWZp
bGUubGliCkBAIC0xNTQsNiArMTU0LDEyIEBAIF9jX2ZsYWdzICs9ICQoaWYgJChwYXRzdWJzdCBu
JSwsIFwKIAkJJChQR09fUFJPRklMRV8kKGJhc2V0YXJnZXQpLm8pJChQR09fUFJPRklMRSl5KSwg
XAogCQkkKENGTEFHU19QR09fQ0xBTkcpKQogZW5kaWYKKyMgVXNlIHZtbGludXgucHJvZmRhdGEg
cHJvZmlsZSBmaWxlCitpZmVxICgkKENPTkZJR19QR09fQ0xBTkdfUFJPRkRBVEEpLHkpCitfY19m
bGFncyArPSAkKGlmICQocGF0c3Vic3QgbiUsLCBcCisJCSQoUEdPX1BST0ZEQVRBXyQoYmFzZXRh
cmdldCkubykkKFBHT19QUk9GREFUQSl5KSwgXAorCQkkKENGTEFHU19QR09fQ0xBTkdfUFJPRkRB
VEEpKQorZW5kaWYKIAogIwogIyBFbmFibGUgYWRkcmVzcyBzYW5pdGl6ZXIgZmxhZ3MgZm9yIGtl
cm5lbCBleGNlcHQgc29tZSBmaWxlcyBvciBkaXJlY3Rvcmllcwo=
--0000000000003e955e05b95fbcbc--
