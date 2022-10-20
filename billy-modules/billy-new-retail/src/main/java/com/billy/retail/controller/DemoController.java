package com.billy.retail.controller;

import com.billy.common.core.page.TableDataInfo;
import com.billy.common.core.web.controller.BaseController;
import com.billy.retail.domain.DoThree;
import com.billy.retail.domain.DoTwo;
import com.billy.retail.domain.ShopModel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @package com.mf.web
 * @who MiaoMiao "Sprout" BI
 * @date 2021-12-15 14:03:37
 */
@RestController
@RequestMapping("/demo")
@Api(tags = "1.测试")
public class DemoController extends BaseController
{
    @GetMapping("/helloList")
    @ApiOperation("测试分页")
    public TableDataInfo helloList()
    {
        List<ShopModel> list = new ArrayList<>();
        ShopModel shopModel = new ShopModel();

        shopModel.setShop_id("123");

        ShopModel shopModel2 = new ShopModel();
        shopModel2.setShop_id("111");
        ShopModel shopModel3 = new ShopModel();
        shopModel3.setShop_id("222");
        ShopModel shopModel4 = new ShopModel();
        shopModel4.setShop_id("44444");
        ShopModel shopModel5 = new ShopModel();
        shopModel5.setShop_id("5555");
        list.add(shopModel);
        list.add(shopModel);
        list.add(shopModel2);
        list.add(shopModel3);
        list.add(shopModel4);
        list.add(shopModel5);
        DoTwo d1 = new DoTwo();
        DoThree d3 = new DoThree();
        startPage();
        return getDataTable(list);

    }

}
